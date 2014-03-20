class PaymentsController < ApplicationController
    respond_to :json # default to Active Model Serializers
    def index
      respond_with Payment.all
    end

    def show
      respond_with Payment.find(params[:id])
    end

    def create
      respond_with Payment.create(payment_params)
    end

    def update
      respond_with Payment.update(params[:id], payment_params)
    end

    def destroy
      respond_with Payment.destroy(params[:id])
    end

    private
    def payment_params
      params.require(:payment).permit(:user_id, :name, :amount_cents, :payment_at) # only allow these for now
    end
  end
