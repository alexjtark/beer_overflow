class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper

  protect_from_forgery with: :exception

  def authenticate_user!
    if session[:user_id]
      @current_user = User.find session[:id]
      return true
    else
      redirect_to(:controller => 'sessions', :action => 'new')
      return false
    end
  end

  def save_login_state
    if session[:id]
      redirect_to(:controller => 'questions', :action => 'index')
      return false
    else
      return true
    end
  end

  def get_votable
      @votable = params[:votable].classify.constantize.find(votable_id)
  end

  def votable_id
    params[(params[:votable].singularize + "_id").to_sym]
  end

end
