class PaymentsController < ApplicationController
  expose(:events){ Payment.all }
  expose(:event){
    if params[:action] == 'new'
      Payment.new()
    elsif params[:action] == 'create'
      Payment.new(params[:event])
    elsif params[:action] == 'show' || params[:action] == 'edit'
      Payment.find(params[:id])
    end
  }
  def new
  end
  def show
  end
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: payments }
    end
  end
  def create
    if params[:payment][:from_date].empty?
      params[:payment][:from_date] = Date.today
    end
    if params[:payment][:to_date].empty?
      params[:payment][:to_date] = Date.today
    end
    if params[:payment][:is_all_day] == '0'
      if params[:payment][:from_time].empty?
        params[:payment][:from_time] = Time.now.beginning_of_day
      end
      if params[:payment][:to_time].empty?
        params[:payment][:to_time] = Time.now.end_of_day
      end
    end
    if payment.save
      flash[:notice] = 'Payment Created'
      redirect_to root_path
    else
      render :new
    end
  end
  def update
    e = Payment.find(params[:id])
    e.update_attributes(params[:payment])
    flash[:notice] = 'Payment Updated'
    redirect_to root_path
  end
  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    redirect_to root_path
  end
end
