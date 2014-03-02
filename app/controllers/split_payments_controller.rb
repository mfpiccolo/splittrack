class SplitPaymentsController < ApplicationController

  def new
    @split_payment = SplitPayment.new
    @user_options = User.all.map { |u| [u.name, u.id] }
  end

  def create
    if @split_payment = current_user.split_payments.create!(split_payment_params)
      CreateEntries.call(current_user, params[:contact_payments], @split_payment)
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
