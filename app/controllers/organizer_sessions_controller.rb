class OrganizerSessionsController < ApplicationController

    def create 
        organizer = Organizer.find_by(email: params[:email])
        if organizer&.authenticate(params[:password])
            session[:organizer_id] = organizer.id 
            render json: organizer    
        
        else
            errors = ["Invalid email or password"]
            # if organizer.nil?
            #     errors << 'invalid password'
            # else 
            #     errors << 'invalid email'
            # end
            render json: { errors: errors }, status: :unauthorized 
        end 
    end

    def destroy      
       if logged_in?
        session.delete :organizer_id
        head :no_content 
       else
        errors = ['Not logged in']
        render json: { errors: errors }, status: :unauthorized
       end
    end 

    private  
    def logged_in?
        #    !session[:user_id].nil?
           session.include? :organizer_id
    end 
end
