class OrganizersController < ApplicationController
    # before_action :authorize_organizer

    def index
        organizers = Organizer.all 
        render json: organizers 
      end
    
      def show 
        organizer = Organizer.find_by(id: session[:organizer_id]) 
        if organizer
            render json: organizer 
        else
            render json: { error: "not authorized here" }, status: :unauthorized 
        end 
      end

      def create 
        organizer = Organizer.new(organizer_params)
        
        if organizer.save 
          session[:organizer_id] = organizer.id 
          render json: organizer, status: :created 
        else
          render json: { error: "Not created"}, status: :unauthorized 
        end
      end
    
      def update  
        organizer = Organizer.find(params[:id])
        
        if organizer.update!(organizer_params)
          session[:organizer_id] = organizer.id 
          render json: organizer
        else
          render json: { error: "Not updated"}, status: :unauthorized 
        end
      end
    
      def destroy 
        organizer = Organizer.find(params[:id])
        organizer.delete 
        head :no_content 
      end
    
    
      private
      def organizer_params 
        params.permit(:first_name, :last_name, :password, :email, :age) 
      end

      def authorize_organizer
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :organizer_id
      end
end
 