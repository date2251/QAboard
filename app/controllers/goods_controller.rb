class GoodsController < ApplicationController
  def create
		@answer = Answer.find(params[:answer_id])
		current_user.love(@answer)
		flash[:success] = 'いいねを押しました'
		redirect_to question_path(@answer.question_id)
  end

  def destroy
		@answer = Answer.find(params[:answer_id])
		current_user.unlove(@answer)
		flash[:success] = 'いいねを解除しました'
		redirect_to question_path(@answer.question_id)
  end
end
