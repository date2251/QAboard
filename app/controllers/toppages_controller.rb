class ToppagesController < ApplicationController
	before_action :tags, only: [:index, :search]

  def index
		@questions = Question.order(id: :desc).page(params[:page]).per(10)
  end

	def search
		@searchword = params[:search][:searchwords]
		@categoryword = params[:search][:categorywords]
		if @searchword
			@questions = Question.where("content LIKE ?", "%#{@searchword}%").order(id: :desc).page(params[:page]).per(10)
		else
			@questions = Question.where("tag LIKE ?", "%#{@categoryword}%").order(id: :desc).page(params[:page]).per(10)
		end
		@count_questions = @questions.count
		render 'search'
	end

	private

	def tags
		@tags = Question.select(:tag).distinct
	end
end
