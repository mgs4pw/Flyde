class InterviewsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :get_basedata

  def interview_sent
    if current_user.user_type == User::COMPANY
      @interviews = current_user.company_interviews.sent  
    elsif current_user.user_type ==User::STUDENT
    end
  end

  def interview_scheduled
    if current_user.user_type == User::COMPANY
      @interviews = current_user.company_interviews.scheduled
    elsif current_user.user_type ==User::STUDENT
    end
  end

  def interview_denied
    if current_user.user_type == User::COMPANY
      @interviews = current_user.company_interviews.denied
    elsif current_user.user_type ==User::STUDENT
    end
  end

  def view
    redirect_to interview_sent_path    
  end

  def destroy
    interview = Interview.find params[:id]

    if interview.destroy
      redirect_to interview_sent_path, notice: "Interview Request was successfully deleted."
    else
      redirect_to interview_sent_path, alert: "Failed to delete Interview Request."
    end
  end

end