class ApplicationController < ActionController::Base
  before_action :set_user
  protected
  def set_user
    @current_user= User.find_by(id: session[:id])
  end
end
