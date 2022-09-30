class EventsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @event = Event.new
  end

  def create
    @group = Group.find(params[:group_id])
    @event = Event.new(event_params)
    if @event.save
      redirect_to group_events_complete_path(@group)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content)
  end
end
