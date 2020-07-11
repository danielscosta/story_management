class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]

  def create
    @organization = Organization.find_by(slug: params[:session][:organization].downcase)
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in
      redirect_to "https://rubyonrails.org/"
    else
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to "https://rubyonrails.org/"
  end
end
