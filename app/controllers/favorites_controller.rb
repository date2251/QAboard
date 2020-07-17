class FavoritesController < ApplicationController
  def create
		@question = Question.find(params[:question_id])
		current_user.favorite(@question)
		flash[:success] = 'お気に入りに登録しました'
		redirect_to question_path(@question.id)
  end

  def destroy
		@question = Question.find(params[:question_id])
		flash[:success] = 'お気に入りを解除しました'
		current_user.unfavorite(@question)
		redirect_to question_path(@question.id)
  end
end
