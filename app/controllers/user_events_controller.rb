require 'twilio-ruby'

class UserEventsController < ApplicationController
  def create
    sleep 2
    numbers = params[:user_event][:phone_number]
    numbers_arr = numbers.split(', ')
    @event = Event.find(params[:event_id])
    @user_event = UserEvent.create(user: current_user, event: @event)
    authorize @user_event

    # user_events = numbers_arr.map do |number|
    #   user_event = UserEvent.create!(
    #   phone_number: number,
    #   event_id: params[:event_id]
    # )
    # end

    # user_event = UserEvent.create(
    #   phone_number: params[:user_event][:phone_number],
    #   event_id: params[:event_id]
    # )

    # user_events.each do |user_event|
    #   InvitationJob.perform_later(user_event.id)
    # end

    @event.populate_event
    redirect_to event_path(@event)
  end

  # custom routes GET - url envoye par twilio
  # /user_event/:id
  def confirm_invitation
    # recupere l'user_event avec l'id
    @user_event = UserEvent.find(params[:id])
    if params[:token] == @user_event.event.token
      # renseigne user avec current_user
      @user_event.user = current_user
      # redirige vers une vue
      redirect to
    else
      # redirige vers ... a definir
    end
  end

  private

  def user_event_params
    params.require(:user_event).permit(:present?, :phone_number)
  end
end
