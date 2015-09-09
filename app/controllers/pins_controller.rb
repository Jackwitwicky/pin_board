class PinsController < ApplicationController
  before_action :log_in_required, except: [:index, :show]

  def index
    @pin = Pin.all.order("created_at DESC")
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = Pin.new
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      flash[:success] = "Your pin has been created"
      redirect_to @pin
    else
      render 'new'
    end
  end

  def update
    @pin = Pin.find_by(id: params[:id])

    if @pin.update(pin_params)
      flash[:success] = "Your pin has been edited"
      redirect_to @pin
    else
      render 'edit'
    end
  end

  def destroy
    @pin = Pin.find_by(id: params[:id])
    @pin.destroy

    flash[:success] = "Your pin has been deleted"
    redirect_to root_path
  end

  private
    def pin_params
      params.require(:pin).permit(:title, :description, :image)
    end
end
