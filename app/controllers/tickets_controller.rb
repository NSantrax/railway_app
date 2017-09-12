class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = current_user.tickets.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket, notice: "Ticket successfully created."
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @ticket.destroy if current_user == @ticket.user
    redirect_to tickets_path
  end

  private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(
        :train_id,
        :last_name, :first_name, :middle_name,
        :passport_number, :start_station_id, :end_station_id
      )
    end
end
