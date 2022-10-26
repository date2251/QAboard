# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]

  def show
    @user = User.find(params[:id])
    @questions = Question.where(user_id: @user.id).order(id: :desc).page(params[:page]).per(10)
    @count_good = counts_gooded(@user)
  end

  def answers
    @user = User.find(params[:id])
    @answers = Answer.where(user_id: @user.id).order(id: :desc).page(params[:page]).per(10)
    @count_good = counts_gooded(@user)
  end

  def favorites
    @user = User.find(params[:id])
    @questions = @user.favoritings.order(id: :desc).page(params[:page]).per(10)
    @count_good = counts_gooded(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'アカウントを作成しました'
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = 'アカウントの作成に失敗しました'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
