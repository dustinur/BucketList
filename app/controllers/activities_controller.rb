class activitiesController < ApplicationController
  before_action :set_list
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = @list.activities
  end

  def show
  end

  def new
    @activity = @list.activities.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @activity = @list.activities.new(activity_params)
    if @activity.save
      redirect_to [@list, @activity]
    else
      render partial: "form"
    end
  end

  def update
    if @activity.update(activity_params)
      redirect_to [@list, @activity]
    else
      render partial: "form"
    end
  end

  def destroy
    @activity.destroy
    redirect_to list_activities_path
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
