class PaymentInstancesController < ApplicationController
  # GET /payments
  # GET /payments.json
  def index
    #@payment_instances = PaymentInstance.occurrences_between(Date.parse('1900-01-01'),Date.parse('9999-01-01'))
    if params[:calendar_ids]
      @payment_instances = PaymentInstance.occurrences_between(Date.today - 1.year,Date.today + 1.year, params[:calendar_ids])
    else
      @payment_instances = PaymentInstance.occurrences_between(Date.today - 1.year,Date.today + 1.year)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payment_instances.to_json(:methods => [:color]) }
    end
  end
end
