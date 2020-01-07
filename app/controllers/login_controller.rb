class LoginController < ApplicationController
  before_action :verify_user, only: :create
  def create
    render json: {data: @user.email}, status: :ok
  end

  private
  def verify_user
    @user ||= User.find_by email: auth_params[:email], password: auth_params[:password]
    return if @user
    render json: {message: "Invalid email or password"}, status: :forbidden
  end

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
