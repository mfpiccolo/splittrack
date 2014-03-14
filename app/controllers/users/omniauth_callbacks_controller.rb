class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def venmo
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    auth = request.env["omniauth.auth"]

    venmo = Venmo.new(auth.credentials.token)
    venmo_user = venmo.get_me

    current_user.update_attributes(
      provider: auth.provider,
      uid: auth.uid,
      token: auth.credentials.token,
      venmo_id: venmo_user.id,
      about: venmo_user.about,
      display_name: venmo_user.display_name,
      first_name: venmo_user.first_name,
      last_name: venmo_user.last_name,
      profile_picture_url: venmo_user.profile_picture_url,
      username: venmo_user.username,
      balance: venmo_user.balance.to_i
    )

    if current_user.persisted?
      sign_in_and_redirect current_user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "venmo") if is_navigational_format?
    else
      session["devise.venmo_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    set_flash_message :alert, :failure, :kind => OmniAuth::Utils.camelize(failed_strategy.name), :reason => failure_message
    redirect_to after_omniauth_failure_path_for(resource_name)
  end

  protected

  def handle_unverified_request
    true
  end
end
