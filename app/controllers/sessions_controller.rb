class SessionsController < Devise::SessionsController

  skip_before_filter :verify_authenticity_token

  def new
    super
  end

  def create
    resource = User.find_by_email(params[:user][:email])
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")

    sign_in_and_redirect(resource_name, resource)

  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource

    render :json => {:success => true, :user_type => resource.user_type}, status: :created and return
  end

  def destroy
    binding.pry
    sign_out

    redirect_to root_path
  end
 
  def failure
    
    render :json => {:success => false, :errors => ["Authentication failed."]} and return
  end
end