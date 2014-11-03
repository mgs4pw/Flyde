class CustomRedirection < Devise::FailureApp
  def respond
    if request.format == :json or request.content_type == 'application/json' # == :json does not works here
      json_failure
    else
      super
    end
  end

  def json_failure
    self.status = 401
    self.content_type = 'application/json'
    self.response_body = {"success"=> false, "errors" => "Email address and Password are invalid"}.to_json
  end
end