class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
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
  end

  def index
    @events = Event.all.order("created_at DESC")
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event successfully updated"
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :location, :description, :date, :time)
  end

end
