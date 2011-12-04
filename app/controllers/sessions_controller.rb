class SessionsController < ApplicationController
  def create
    user = User.find_by_email params[:sessions][:email]

    if user.nil?
      flash.now[:error] = "Invalid email"
      render 'new'
    else
      login_user user
      redirect_to users_path, :notice => "Successfully logged in"
    end
  end

  def destroy
    logout_user
    redirect_to root_path
  end

  def new

  end

end
