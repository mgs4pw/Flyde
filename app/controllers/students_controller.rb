class StudentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_basedata

  def dashboard
    @student = current_user
    @interviews = @student.student_interviews.sent

    @experience = Experience.new
    @experiences = @student.experiences

    @skill = Skill.new
    @skills = @student.skills
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
      redirect_to student_dashboard_path, :alert => "Failed to save experience."
    end
  end

  def destroy_experience
    @exp = current_user.experiences.find params[:id]

    if @exp.destroy
      redirect_to student_dashboard_path, notice: "Experience was successfully deleted."
    else
      redirect_to student_dashboard_path, alert: "Failed to delete experience."
    end
  end

  def create_skill
    @skill = current_user.skills.build permit_skill_params

    if @skill.save
      redirect_to student_dashboard_path, :notice => "Skill is successfully saved."
    else
      redirect_to student_dashboard_path, :alert => "Failed to save skill."
    end
  end

  def destroy_skill
    @sk = current_user.skills.find params[:id]

    if @sk.destroy
      redirect_to student_dashboard_path, notice: "Skill was successfully deleted."
    else
      redirect_to student_dashboard_path, alert: "Failed to delete skill."
    end
  end

  def company_profile
    company = User.find(params.permit(:id)[:id])

    if company.nil?
      render :json => {errors: "Could not retrieve company profile."}, status: :unprocessible_entity and return
    else
      company_json = {
        :company_id     => company.id,
        :company_name   => company.company_name,
        :name           => company.name,
        :email          => company.email,
        :country        => company.country_id.nil? ? '' : Country.find(company.country_id).name,
        :position       => company.position,
        :phone_number   => company.phone_number,
        :website        => company.website,
        :photo          => company.photo.url
      }.to_json

      render :json => {
        :success => true, 
        :company => company_json
      }, status: :created and return
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

  def permit_skill_params
    params.require(:skill).permit :skill
  end
end