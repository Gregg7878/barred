class OrganizerSessionsController < ApplicationController

    def create 
        organizer = Organizer.find_by(email: params[:email])
        if organizer&.authenticate(params[:password])
            session[:organizer_id] = organizer.id 
            render json: organizer    
        
        else
            errors = ["Invalid email or password"]
            render json: { errors: errors }, status: :unauthorized 
        end 
    end

    def destroy
        session.delete :organizer_id
        head :no_content
    end
end
