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
    @position = current_user.positions.build permit_position_params

    if @position.save
      redirect_to company_dashboard_path, :notice => "Position is successfully saved."
    else
      redirect_to company_dashboard_path, :alert => "Failed to save experience."
    end

  end

  def destroy_position
    pos = current_user.positions.find params[:id]

    if pos.destroy
      redirect_to company_dashboard_path, notice: "Position was successfully deleted."
    else
      redirect_to company_dashboard_path, alert: "Failed to delete position."
    end
  end

  private

  # Pass parameters to controller
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

  def permit_position_params
    if params[:position][:skill_1].blank?
      params[:position].delete :skill_1
      params[:position].delete :importance_1
    end

    if params[:position][:skill_2].blank?
      params[:position].delete :skill_2
      params[:position].delete :importance_2
    end

    if params[:position][:skill_3].blank?
      params[:position].delete :skill_3
      params[:position].delete :importance_3
    end
    
    params.require(:position).permit :name, :skill_1, :importance_1, :skill_2, :importance_2, :skill_3, :importance_3
  end
end