class SessionsController < ApplicationController

  def new
    redirect_to '/auth/dwolla'
  end

  def create
    auth                      = request.env["omniauth.auth"]
    session[:omniauthToken]   = auth[:credentials][:token]
    session[:omniauthUrl]     = auth[:credentials][:instance_url]
    session[:omniauthRefresh] = auth[:credentials][:refresh_token]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    binding.pry
    user.token = auth[:credentials][:token]
    user.save
    session[:user_id] = user.id

    if user.email.blank?
      redirect_to edit_user_path(user), :notice => "Please enter your email address."
    else
      redirect_to root_url, :notice => 'Signed in!'
    end

    # unless the oldest record has been updated in the last hour
    # TODO enable this feature
    # SfSynch.update_if_needed_for(current_user)
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
