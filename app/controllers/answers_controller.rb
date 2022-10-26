class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params.permit(:content, :question_id, :user_id))
    if @answer.save
      flash[:success] = '回答を投稿しました'
      redirect_to question_path(params[:question_id])
    else
      flash.now[:danger] = '回答を投稿出来ませんでした'
      render 'questions/show'
    end
  end
end
