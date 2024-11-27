class DonationsController < ApplicationController
  before_action :check_request_goal, only: [:new, :create]
  def new
    @request = Request.find(params[:request_id])
    @donation = @request.interests.new # Assuming donations are represented by interests
  end

  def create
    @request = Request.find(params[:request_id])
    quantity = params[:quantity].to_i

    # Create a new interest entry associated with the request and current user
    @interest = @request.interests.new(user: current_user, quantity: quantity, status: 0)

    if @interest.save
      redirect_to request_path(@request), notice: "Thank you for your generosity! We will update your donation status once the request has been confirmed."
    else
      flash[:alert] = "There was an issue with your donation. Please try again."
      render :new
    end
  end

  private

  def check_request_goal
    request = Request.find(params[:request_id])
    if request.interests.where(status: 1).sum(:quantity) >= request.quantity
      flash[:alert] = "This request has already reached its goal. You cannot donate anymore."
      redirect_to request_path(request)
    end
  end
end
