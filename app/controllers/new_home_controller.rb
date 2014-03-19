class NewHomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @payment = Payment.new
    # only commented out so I dont slam the API
    # @contacts = Venmo.new(current_user.token, current_user.venmo_id).get_contacts
  end

end
