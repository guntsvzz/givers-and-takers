class VerificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Fetch all users with the role 'taker' and status 0 (unverified)
    @takers = User.where(role: 'taker', status: 0).page(params[:page]).per(10)
  end

  def update_status
    # Find the user (taker) and update their status based on the button clicked
    taker = User.find(params[:id])
    
    if params[:status] == 'verified'
      taker.update(status: 1)  # Verified
    elsif params[:status] == 'non_verified'
      taker.update(status: 2)  # Non-verified
    end

    redirect_to verifications_path
  end
end
