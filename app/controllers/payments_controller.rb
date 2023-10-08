class PaymentsController < ApplicationController
    before_action :find_payment, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user

    def index
      @payments = Payment.all
    end
  
    def show

    end
  
    def new
      @payment = Payment.new
    end
  
    def create
      @payment = Payment.new(payment_params)
      if @payment.save
        redirect_to @payment, notice: 'Payment was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @payment.update(payment_params)
        redirect_to @payment, notice: 'Payment was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @payment.destroy
      redirect_to payments_path, notice: 'Payment was successfully destroyed.'
    end
  
    private
  
    def payment_params
      params.require(:payment).permit(:ticket_id, :amount, :transaction_id, :status, :timestamp)
    end
  
    def find_payment
      @payment = Payment.find(params[:id])
    end
  end
  