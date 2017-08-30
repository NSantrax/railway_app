class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
  end

  private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(
        :id, :train_id, :user_id,
        :last_name, :first_name, :middle_name,
        :passport_number, :start_station_id, :end_station_id
      )
    end
end
