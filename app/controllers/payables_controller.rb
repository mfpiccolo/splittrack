class PayablesController < ApplicationController
  def index
    @payables = current_user.payables
  end
end
