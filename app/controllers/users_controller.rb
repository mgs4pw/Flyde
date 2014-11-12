class UsersController < ApplicationController
  #before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def create
    if user_signed_in?
      render(:json => @user = current_user) and return
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  private

  def permit_params
  end

end
