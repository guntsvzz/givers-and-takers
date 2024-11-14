class InterestsController < ApplicationController
  before_action :set_interest, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # before_action :authorize_user, only: [:create, :new]  # Ensure only certain users can create an interest

  # GET /interests or /interests.json
  def index
    @interests = Interest.all
  end

  # GET /interests/1 or /interests/1.json
  def show
  end

  # GET /interests/new
  def new
    @interest = Interest.new
  end

  # GET /interests/1/edit
  def edit
  end

  # POST /interests or /interests.json
  def create
    @interest = Interest.new(interest_params)

    # Set the user to the currently logged-in user
    @interest.user = current_user

    # Assign the request_id from the form submission
    @interest.request = Request.find(params[:interest][:request_id]) # Use request_id here

    respond_to do |format|
      if @interest.save
        format.html { redirect_to interest_url(@interest), notice: "Interest was successfully created." }
        format.json { render :show, status: :created, location: @interest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # def create
  #   @interest = Interest.new(interest_params)
  #   if @interest.save
  #     redirect_to interests_path, notice: "Interest created successfully."
  #   else
  #     render :new
  #   end
  # end

  # PATCH/PUT /interests/1 or /interests/1.json
  def update
    respond_to do |format|
      if @interest.update(interest_params)
        format.html { redirect_to interest_url(@interest), notice: "Interest was successfully updated." }
        format.json { render :show, status: :ok, location: @interest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interests/1 or /interests/1.json
  def destroy
    @interest.destroy!

    respond_to do |format|
      format.html { redirect_to interests_url, notice: "Interest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def interest_params
    params.require(:interest).permit(:request_id, :quantity, :delivery_method)
  end
  
  # # Use callbacks to share common setup or constraints between actions.
  def set_interest
    @interest = Interest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def interest_params
    params.require(:interest).permit(:request_id, :quantity, :delivery_method, :user_id)
  end
  

  # # Restrict access to authorized users
  # def authorize_user
  #   unless current_user.admin? #|| current_user.has_role?(:authorized_user)
  #     redirect_to root_path, alert: "You are not authorized to create interests."
  #   end
  # end    
end
