class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by_name(params[:session][:name].downcase)
    if user
      sign_in user
      redirect_to user
    else
      flash[:error] = 'Invalid name combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
