class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: [:edit, :update, :show, :destroy]
  before_action :set_train, only: [:new, :create]

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to [:admin, @train], notice: "Carriage successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to [:admin, @carriage], notice: "Carriage successfully updated."
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @carriage.destroy
    redirect_to [:admin, @carriage.train]
  end

  private
    def set_train
      @train = Train.find(params[:train_id])
    end

    def set_carriage
      @carriage = Carriage.find(params[:id])
    end

    def carriage_params
      params.require(:carriage).permit(:train_id, :type, :bottom_seats, :top_seats, :side_top_seats, :side_bottom_seats, :chair_seats)
    end
end
