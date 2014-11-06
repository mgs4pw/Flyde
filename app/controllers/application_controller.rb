class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def get_basedata
    @countries = Country.includes(:provinces).all
    @study_fields = StudyField.all
  end

end
