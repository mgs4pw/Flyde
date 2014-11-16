class CompaniesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_basedata

  def dashboard
    @company = current_user

    @positions = @company.positions
    @position = Position.new
  end

  def profile
    @company = current_user
  end

  def update_profile

    @company = current_user
    if @company.update_attributes permit_params
      redirect_to company_profile_update_path, :notice => "Profile is successfully updated."
    else
      redirect_to company_profile_update_path, :alert => "Failed to update profile."
    end

  end

  def position
  end

  def permit_params
    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end

    if params[:user][:photo].blank?
      params[:user].delete :photo
    end

    params.require(:user).permit :email, :password, :name, :company_name, :phone_number, :position, 
                                  :website, :description, :photo
                                 
  end

  def permit_experience_params
    params.require(:experience).permit :experience, :date_from, :date_to
  end

  def permit_skill_params
    params.require(:skill).permit :skill
  end
end