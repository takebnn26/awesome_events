class EventsController < ApplicationController
  before_action :authenticate

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: '作成しました'
    else
      flash.now[:alert] = '失敗しました'
      render :new
    end
  end
end
