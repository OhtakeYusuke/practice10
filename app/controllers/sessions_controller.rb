class SessionsController < ApplicationController
  
  def new
    
  end

  def create
    @session = User.find_by(email: session_params[:email])
    if @session&.authenticate(session_params[:password])
      session[:user_id] = @session.id
      redirect_to root_url, notice: "ログインしました"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "ログアウトしました"
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
