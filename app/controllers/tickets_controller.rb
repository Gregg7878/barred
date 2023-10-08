class TicketsController < ApplicationController

    before_action :authenticate_user

    # display list of tickets for current user
    def index
        @tickets = current_user.tickets
    end
    
    
    # create a new ticket
    def create
        @ticket = Ticket.new(ticket_params)
        if @ticket.save
          render json: @ticket, status: :created
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
    end

    # other CRUD actions
    private

    def ticket_params
        params.require(:ticket).permit(:event_id, :customer_id, :ticket_type, :price, :purchase_date)
    end

end
