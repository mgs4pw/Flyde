class CandidatesController < ApplicationController

  def new
    @company = current_user
    @positions = @company.positions

    # Delete all previous matched candidates
    MatchedStudent.delete_all(['company_id = ?', @company.id])

    importance = [0.5, 0.3, 0.2]
    @positions.each do |pos|
      possible_students = StudentTest.select("user_id").where(
        'skill_list_id in (?)', [pos.skill_1, pos.skill_2, pos.skill_3]).group(:user_id)

      possible_students.each do |st|
        score_1 = 0
        score_2 = 0
        score_3 = 0

        # Calculate first test score
        unless pos.skill_1.blank?
          test_record = StudentTest.where('user_id = ? and skill_list_id =?', st.user_id, pos.skill_1).first

          if test_record.blank? || test_record.result.blank?
            score_1 = 0
          else
            score_1 = test_record.result * importance[pos.importance_1.to_i - 1]
          end
        end

        # Calculate second test score
        unless pos.skill_2.blank?
          test_record = StudentTest.where('user_id = ? and skill_list_id =?', st.user_id, pos.skill_2).first

          if test_record.blank? || test_record.result.blank?
            score_2 = 0
          else
            score_2 = test_record.result * importance[pos.importance_2.to_i - 1]
          end
        end

        # Calculate third test score
        unless pos.skill_3.blank?
          test_record = StudentTest.where('user_id = ? and skill_list_id =?', st.user_id, pos.skill_3).first

          if test_record.blank? || test_record.result.blank?
            score_3 = 0
          else
            score_3 = test_record.result * importance[pos.importance_3.to_i - 1]
          end
        end

        total_score = score_1 + score_2 + score_3
        if total_score > 0
          interview = MatchedStudent.interview_info(@company.id, st.user_id, pos.id)
          if interview.nil?
            MatchedStudent.create(
              company_id: @company.id, 
              student_id: st.user_id, 
              position_id: pos.id, 
              matching_score: total_score
            )
          else
            MatchedStudent.create(
              company_id: @company.id, 
              student_id: st.user_id, 
              position_id: pos.id, 
              matching_score: total_score,
              interview_sent: interview.status
            )
          end
        end
      end
    end

    @matched_candidates = MatchedStudent.where('company_id = ?', @company.id)
  end

  def get_student
    candidate = User.includes(:experiences).includes(:skills).find(params.permit(:id)[:id])

    if candidate.nil?
      render :json => {errors: "Could not retrieve candidate profile."}, status: :unprocessible_entity and return
    else
      candidate_json = {
        :student_id     => candidate.id,
        :name           => candidate.name,
        :email          => candidate.email,
        :country         => candidate.country_id.nil? ? '' : Country.find(candidate.country_id).name,
        :province       => candidate.province_id.nil? ? '' : Province.find(candidate.province_id).name,
        :phone_number   => candidate.phone_number,
        :academic_status => candidate.academic_status,
        :study_field    => candidate.study_field_id.nil? ? '' : StudyField.find(candidate.study_field_id).name,
        :school         => candidate.school,
        :major          => candidate.major,
        :birth_year     => candidate.birth_year,
        :photo          => candidate.photo.url
      }.to_json

      render :json => {
        :success => true, 
        :candidate => candidate_json, 
        :experience => candidate.experiences.to_json,
        :skill => candidate.skills.to_json
      }, status: :created and return
    end
  end

  def request_interview
    old_interview = Interview.where(
      'company_id = ? and student_id = ? and position_id = ?', 
      current_user.id, 
      params[:interview][:student_id],
      params[:interview][:position_id]
    ).first

    matched_student = MatchedStudent.where(
      'company_id = ? and student_id = ? and position_id = ?', 
      current_user.id, 
      params[:interview][:student_id],
      params[:interview][:position_id]
    ).first
    
    if old_interview.nil?
      interview = Interview.new permit_request_interview_param
      interview.company_id = current_user.id
      interview.sent_date = Time.now
      interview.status = Interview::SENT
      interview.matching_score = matched_student.matching_score
      interview.save

    else
      old_interview.update_attributes permit_request_interview_param
    end

    redirect_to company_candidate_path
  end

  private

  def permit_request_interview_param
    params.require(:interview).permit :position_id, :student_id, :interview_datetime, :description
  end

end