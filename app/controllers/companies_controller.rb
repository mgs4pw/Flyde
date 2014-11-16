class CompaniesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_basedata

  def dashboard
    @company = current_user
  end

  def update_profile

    @company = current_user
    if @company.update_attributes permit_params
      redirect_to company_dashboard_path, :notice => "Profile is successfully updated."
    else
      redirect_to company_dashboard_path, :alert => "Failed to update profile."
    end

  end

  def permit_params
    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end

    if params[:user][:photo].blank?
      params[:user].delete :photo
    end

    params.require(:user).permit :email, :password, :name, :phone_number, :birth_year, :photo,
                                 :academic_status, :study_field_id, :school, :major
  end

  def permit_experience_params
    params.require(:experience).permit :experience, :date_from, :date_to
  end

  def permit_skill_params
    params.require(:skill).permit :skill
  end
end