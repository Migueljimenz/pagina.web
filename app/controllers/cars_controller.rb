class CarsController < ApplicationController
   before_action :set_car,only: [:show, :edit]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def update
    @car = Car.update(car_new_update)
    if 
      redirect_to cars_path(@car), notice: 'Informacion actualizada con exito'
    else 
      flash[:alert] = "No se actulizo la informacion"
      render:edit
    end
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path(@car)
      flash[:notice] = 'Vehiculo Almacenado'
    else
      flash[:alert] = "El carro no fue creado"
      render :new
    end
  end

  def destroy
    @car = Car.destroy(params[:id])
    if @car.destroy
      redirect_to cars_path(@car)
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:modelo,:placa,:color,:avatar)
  end

  def car_new_update
    params.require(:car).permit(:modelo,:placa,:color,:avatar)
  end

end
