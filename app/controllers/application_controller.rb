class ApplicationController < ActionController::Base
    def log_in(admin)
    session[:session_token] = admin.reset_session_token
  end

  def current_user
    Admin.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_out!
    current_user.reset_session_token
    session[:session_token] = nil
  end
end
