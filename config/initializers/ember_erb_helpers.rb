Rails.application.assets.context_class.class_eval do
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  # TODO major hack???
  def protect_against_forgery?
    false
  end
end
