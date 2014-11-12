class VisitorsController < ApplicationController

  layout 'frontend'
  skip_filter :authenticate_user!
  before_filter :get_basedata

  def home
  end

end
