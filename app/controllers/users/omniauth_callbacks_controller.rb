class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def dwolla
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    auth = request.env["omniauth.auth"]
    current_user.update_attributes(provider: auth.provider, uid: auth.uid)

    if current_user.persisted?
      sign_in_and_redirect current_user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "dwolla") if is_navigational_format?
    else
      session["devise.dwolla_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    set_flash_message :alert, :failure, :kind => OmniAuth::Utils.camelize(failed_strategy.name), :reason => failure_message
    redirect_to after_omniauth_failure_path_for(resource_name)
  end

  def passthru
    binding.pry
  end

  protected

  def handle_unverified_request
    true
  end
end
