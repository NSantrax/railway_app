class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:edit, :update, :show, :destroy]
  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to @carriage
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @carriage.destroy
    redirect_to @carriage.train
  end
  
  private
  
  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:train_id, :type_class, :bottom_seats, :top_seats)
  end
end
