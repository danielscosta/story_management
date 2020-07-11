class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
    unless signed_in?
      redirect_to root_url
    end
  end
end
