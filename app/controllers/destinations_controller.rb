class DestinationsController < ApplicationController
  before_action :set_list
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destinations = @list.destinations
  end

  def show
  end

  def new
    @destination = @list.destinations.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @destination = @list.destinations.new(destination_params)
    if @destination.save
      redirect_to [@list, @destination]
    else
      render partial: "form"
    end
  end

  def update
    if @destination.update(destination_params)
      redirect_to [@list, @destination]
    else
      render partial: "form"
    end
  end

  def destroy
    @destination.destroy
    redirect_to list_destinations_path
  end

  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def set_destination
      @destination = Destination.find(params[:id])
    end

    def destination_params
      params.require(:topic).permit(:name, :body)
    end
end
