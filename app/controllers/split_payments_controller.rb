class SplitPaymentsController < ApplicationController
  def new
    @split_payment = SplitPayment.new
  end

  def create
    if @split_payment = current_user.split_payments.create(split_payment_params)
      redirect_to "/"
    else
      render "new"
    end
  end

  private

  def split_payment_params
    params.require(:split_payment).permit(:name, :total, :paid, :cash)
  end

end
