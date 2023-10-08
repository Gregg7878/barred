require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  def setup
    @payment_params = {
      ticket_id: 1, 
      amount: 100, 
      transaction_id: '12345', 
      status: 'success', 
      timestamp: Time.now
    }
  end

  test 'should create payment' do
    assert_difference('Payment.count') do
      post :create, params: { payment: @payment_params }
    end

    assert_redirected_to payment_path(assigns(:payment))
    assert_equal 'Payment was successfully created.', flash[:notice]
  end

  test 'should not create payment with invalid params' do
    @payment_params[:ticket_id] = nil  

    assert_no_difference('Payment.count') do
      post :create, params: { payment: @payment_params }
    end

    assert_template :new
  end
end
