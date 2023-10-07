class OrganizersController < ApplicationController

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
    
    
      private
      def organizer_params 
        params.permit(:first_name, :last_name :email, :age) 
      end
end
 