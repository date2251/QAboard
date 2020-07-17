class ToppagesController < ApplicationController
  def index
		@questions = Question.order(id: :desc).page(params[:page]).per(10)
  end

	def search
		@searchword = params[:search][:searchwords]
		@questions = Question.where("content LIKE ?", "%#{@searchword}%").order(id: :desc).page(params[:page]).per(10)
		@count_questions = @questions.count
		render 'search'
	end
end
