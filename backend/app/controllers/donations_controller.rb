class DonationsController < ApplicationController
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
      redirect_to request_path(@request), notice: "Thank you for your donation!"
    else
      flash[:alert] = "There was an issue with your donation. Please try again."
      render :new
    end
  end
end
