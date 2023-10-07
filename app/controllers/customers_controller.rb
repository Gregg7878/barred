class CustomersController < ApplicationController

    def index
        customers = Customer.all 
        render json: customers  
      end 
    
      def show 
        customer = Customer.find_by(id: session[:customer_id]) 
        if customer
            render json: customer, status: :created 
        else
            render json: { error: "not authorized here" }, status: :unauthorized 
        end 
      end
    
      def create 
        customer = Customer.new(customer_params)
        if customer.save 
          session[:customer_id] = customer.id 
          render json: customer, status: :created 
        else
          render json: { error: "Not created"}, status: :unauthorized 
        end
      end
    
      def update  
        customer = Customer.find_by(id: params[:customer_id])
        
        if customer.update!(customer_params)
          session[:customer_id] = customer.id 
          render json: customer
        else
          render json: { error: "Not updated"}, status: :unauthorized 
        end
      end
    
      def destroy 
        customer = Customer.find_by(id: params[:customer_id])
        customer.delete 
        head :no_content 
      end
    
      private 
      def customer_params 
        params.permit(:first_name, :last_name :email, :age)  
      end
end
 