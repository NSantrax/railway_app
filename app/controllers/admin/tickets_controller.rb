class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, except: [:index, :new, :create]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: "Ticket successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private
    def ticket_params
      params.require(:ticket).permit(
        :user_id,
        :last_name, :first_name, :middle_name,
        :passport_number, :start_station_id, :end_station_id
      )
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
end
