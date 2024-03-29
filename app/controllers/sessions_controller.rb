# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました'
      redirect_to root_path
    else
      flash[:danger] = 'ログインに失敗しました'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_path
  end

  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user&.authenticate(password)
      session[:user_id] = @user.id
      true
    else
      false
    end
  end
end
