class EventsController < ApplicationController

  def show
    @event = Event.find(event_params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description,
    :date, :time)
  end

end
