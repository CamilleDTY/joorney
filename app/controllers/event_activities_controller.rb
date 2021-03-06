class EventActivitiesController < ApplicationController
  def create
    @event_activity = EventActivity.new(params_eventactivity)
    @event_activity.event = Event.find(params[:event_id])
    @event_activity.activity = Activity.find(params[:activity_id])
    @event_activity.favorite = true
    @event_activity.save
    authorize @event_activity
    redirect_to event_activities_path(@event_activity.event)
  end

  def destroy
    @event_activity = EventActivity.find(params[:id])
    @event_activity.destroy
    authorize @event_activity
  end

  private

  def params_eventactivity
    params.require(:event_activity).permit(:nb_of_participants)
  end
end
