class RegistrationsController < Devise::RegistrationsController

  skip_before_filter :verify_authenticity_token 
  before_filter :configure_permitted_parameters

  def new
    super
  end

  def create
    @user = User.new configure_permitted_parameters
    
    if @user.save
      if resource.active_for_authentication?
        sign_up(:user, @user)
        
        render :json => {:success => true}, status: :created and return
      else
        expire_data_after_sign_in!

        render :json => {:success => true}, status: :created and return
      end
    else
      clean_up_passwords @user
      
      render :json => {errors: @user.errors.full_messages.to_sentence}, status: :unprocessible_entity and return
    end
  end

  protected

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  def configure_permitted_parameters
     params.require(:user).permit :email, :password, :name, :company_name, :position, :phone_number,
                                :birth_year, :country_id, :province_id, :academic_status, :study_field_id, :user_type
  end

end