class CustomerSessionsController < ApplicationController

    def create 
        customer = Customer.find_by(email: params[:email])
        if customer&.authenticate(params[:password])
            session[:customer_id] = customer.id 
            render json: customer     
        
        else
            errors = ["Invalid email or password"]
            # if customer.nil?
            #     errors << 'invalid password'
            # else 
            #     errors << 'invalid email'
            # end
            render json: { errors: errors }, status: :unauthorized 
        end 
    end

    def destroy
        session.delete :customer_id
        head :no_content
      end

    # def destroy      
    #    if logged_in?
    #     session.delete :customer_id
    #     head :no_content 
    #    else
    #     errors = ['Not logged in']
    #     render json: { errors: errors }, status: :unauthorized
    #    end
    # end 

    # private 
    # def logged_in?
    #        session.include? :customer_id
    # end 
end
