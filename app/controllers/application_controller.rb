class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_gon

  # Set gon's defaults so it doesn't get confused
  def set_gon
    gon.user_id = nil
    gon.current_user = false
  end

end
