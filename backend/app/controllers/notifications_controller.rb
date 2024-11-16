class NotificationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # Ensure that only a 'taker' can access the notifications
    if current_user.role != 'taker'
      redirect_to root_path, alert: 'You are not authorized to view this page.'
    else
      # Get all requests related to the current taker
      @notifications = Request.where(taker_id: current_user.id)
    end
  end

  # New action to show interests related to a specific request
  def view_interest
    @request = Request.find(params[:id]) # Get the request based on the ID
    @interests = Interest.where(request_id: @request.id) # Get the interests for this specific request
  end
end
