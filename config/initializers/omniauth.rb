Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dwolla, ENV['DWOLLA_KEY'], ENV['DWOLLA_SECRET'], :scope => 'accountinfofull|send|request|contacts|transactions|balance|funding|manageaccount', :display => 'popup', :image_size => 'normal', :provider_ignores_state => true
end
