class ToppagesController < ApplicationController
  before_action :tags, only: %i[index search]

  def index
    @questions = Question.order(id: :desc).page(params[:page]).per(10)
  end

  def search
    @searchword = params[:search][:searchwords]
    @categoryword = params[:search][:categorywords]
    @questions = if @searchword
                   Question.where('content LIKE ?', "%#{@searchword}%").order(id: :desc).page(params[:page]).per(10)
                 else
                   Question.where('tag LIKE ?', "%#{@categoryword}%").order(id: :desc).page(params[:page]).per(10)
                 end
    @count_questions = @questions.count
    render 'search'
  end

  private

  def tags
    @tags = Question.select(:tag).distinct
  end
end
