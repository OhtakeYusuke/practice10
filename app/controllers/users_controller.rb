class UsersController < ApplicationController
  before_action :find_user_id, only: [:show, :edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "ユーザ登録を完了しました"
      session[:user_id] = @user.id
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_url, notice: "ユーザ登録を完了しました"
    else
      render :new
    end
  end

  def show

  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :profile, :email, :password)
  end
  def find_user_id
    @user = User.find_by(id: params[:id])
  end
end
