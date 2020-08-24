class UsersController < ApplicationController
  def access
    if valid_user_params?
      user = User.find_for_authentication(username: user_params[:username])
      valid_auth = user && user&.valid_password?(user_params[:password])
      user = User.create(user_params) unless valid_auth
    end
    if user.persisted?
      sign_in(user)
      flash[:success] = "You have been access successfully!"
    else
      flash[:error] = "Invalid username or password. Please try again!"
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def valid_user_params?
    user_params[:username].present? && user_params[:password].present?
  end
end
