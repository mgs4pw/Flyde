class CandidatesController < ApplicationController

  def new
    @company = current_user
    @positions = @company.positions
    binding.pry
    @positions.each do |pos|
      possible_students = StudentTest.select("user_id").where(
        'skill_list_id = ? or skill_list_id =? or skill_list_id = ?', pos.skill_1, pos.skill_2, pos.skill_3).group(:user_id)
      binding.pry
      possible_students.each do |st|
        score_1 = 0
        score_2 = 0
        score_3 = 0

        # Calculate first test score
        unless pos.skill_1.blank?
          test_record = StudentTest.where('user_id = ? and skill_list_id =?', st.user_id, pos.skill_1).first
          binding.pry
          if test_record.blank? || test_record.result.blank?
            score_1 = 0
          else
            score_1 = test_record.result * 0.5
          end
        end

        # Calculate second test score
        unless pos.skill_2.blank?
          test_record = StudentTest.where('user_id = ? and skill_list_id =?', st.user_id, pos.skill_2).first
          binding.pry
          if test_record.blank? || test_record.result.blank?
            score_2 = 0
          else
            score_2 = test_record.result * 0.3
          end
        end

        # Calculate third test score
        unless pos.skill_3.blank?
          test_record = StudentTest.where('user_id = ? and skill_list_id =?', st.user_id, pos.skill_3).first
          binding.pry
          if test_record.blank? || test_record.result.blank?
            score_3 = 0
          else
            score_3 = test_record.result * 0.2
          end
        end

        total_score = score_1 + score_2 + score_3
        binding.pry
      end
    end
  end


end