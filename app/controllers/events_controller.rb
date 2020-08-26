class EventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event successfully created"
    else
      render :new
    end
  end

  def show
    @event = Event.find(event_params[:id])
  end

  def index
    @events = Event.all.order("created_at DESC")
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description,
    :date, :time)
  end

end
