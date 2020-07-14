class UsersController < ApplicationController
	before_action :require_user_logged_in, only: [:create, :show]

  def show
		@user = User.find(params[:id])
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
			render :new
		end
  end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
