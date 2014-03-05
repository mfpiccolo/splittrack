class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @split_payment = SplitPayment.new
  end
end
