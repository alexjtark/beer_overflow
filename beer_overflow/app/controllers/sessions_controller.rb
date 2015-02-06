class SessionsController < ApplicationController
  # before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:create, :login_attempt]

  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
    else
      @errors = @user.errors.messages
      redirect_to :back
    end
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

