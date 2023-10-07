class CustomersController < ApplicationController
    before_action :authorize_customer, only: [:update, :destroy,]
    skip_before_action :authorize_customer, only: [:create] 

    def index
        customers = Customer.all 
        render json: customers  
      end 

    #   def show 
    #     customer = Customer.find_by(id: params[:id])
    #     render json: customer
    #   end
    
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
        customer = Customer.find(params[:id])
        
        if customer.update!(customer_params) 
          session[:customer_id] = customer.id 
          render json: customer
        else
          render json: { error: "Not updated"}, status: :unauthorized 
        end
      end
    
      def destroy 
        customer = Customer.find(params[:id])
        customer.delete 
        head :no_content 
      end
    
      private 
      def customer_params 
        params.permit(:first_name, :password, :last_name, :email, :age)  
      end
 
      def authorize_customer
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :customer_id
      end
end
 