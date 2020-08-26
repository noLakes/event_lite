class EventsController < ApplicationController

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
