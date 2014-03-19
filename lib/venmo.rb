class Venmo

  attr_reader :token, :venmo_id, :conn, :base_url, :contacts, :venmo_user

  def initialize(token, venmo_id=nil)
    @token = token
    @conn = Faraday.new
    @base_url = "https://api.venmo.com/v1/"
    @venmo_id = venmo_id
  end

  def get_contacts
    contact_request_url = base_url + "users/" + venmo_id.to_s + "/friends"

    response = conn.get contact_request_url do |request|
      request.params['access_token'] = token
    end

    @contacts = Hashie::Mash.new(JSON.parse response.body).data
  end

  def get_me
    response = conn.get base_url + "me" do |request|
      request.params['access_token'] = token
    end

    data = Hashie::Mash.new(JSON.parse response.body).data
    @venmo_user = data.user
    @venmo_user.balance = data.balance
    @venmo_user
  end

end
