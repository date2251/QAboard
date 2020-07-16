class QuestionsController < ApplicationController
  def new
		@question = current_user.questions.build
		@answer = Answer.new
  end

  def create
		@question = current_user.questions.new(params.require(:question).permit(:content, :tag))
		if @question.save
			flash[:success] = '質問が投稿されました'
			redirect_to root_path
		else
			flash.now[:danger] = '質問の投稿に失敗しました'
			render :new
		end
  end

  def show
		@question = Question.find(params[:id])
		@questioner = User.find_by(id: @question.user_id)
		@answers = Answer.where(question_id: @question.id)
  end
end
