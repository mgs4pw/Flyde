class ProvincesController < ApplicationController

  skip_filter :authenticate_user!

  def get_by_country

    provinces = Province.get_by_country(params[:country])

    render :json => provinces

  end

end
