class PasswordResetsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:email])

    if user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to root_path, notice: "If an email with that email address exists, we have sent you an email to reset your password"
  end
end