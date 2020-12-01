class Admin::UsersController < ApplicationController
  before_action :admin_check
  def index
    @user = User.all
  end

  private
  def admin_check
    redirect_to root_url, notice: "権限がありません" unless current_user.admin?
  end
end

