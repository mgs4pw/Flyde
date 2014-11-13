class StudentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_basedata

  def dashboard
    @student = current_user

    @experience = Experience.new
    @experiences = @student.experiences
  end

  def update_profile

    @student = current_user
    if @student.update_attributes permit_params
      redirect_to student_dashboard_path, :notice => "Profile is successfully updated."
    else
      redirect_to student_dashboard_path, :alert => "Failed to update profile."
    end

  end

  def create_experience
    @experience = current_user.experiences.build permit_experience_params

    if @experience.save
      redirect_to student_dashboard_path, :notice => "Experience is successfully saved."
    else
      redirect_to student_dashboard_path, :alert => "Filed to save experience."
    end
  end

  def destroy_experience
     @exp = current_user.experiences.find params[:id]

     if @exp.destroy
      redirect_to student_dashboard_path, notice: 'Experience was successfully deleted.'
    else
      redirect_to student_dashboard_path, notice: 'Failed to delete experience.'
    end
  end

  private

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
end