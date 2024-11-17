class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy ]
  before_action :authenticate_user!  # Ensure user is signed in
  # before_action :authorize_user, only: [:create, :new]  # Ensure only certain users can create an interest
  
  def index
    # Get the search query, if provided
    query = params[:query].to_s.strip.downcase

    # If there's a query, perform a case-insensitive search for requests
    if query.present?
      # Perform case-insensitive search where the title starts with the query term
      @requests = Request.where('LOWER(title) LIKE ?', "#{query}%")
    else
      @requests = Request.all
    end
  end

  # GET /requests or /requests.json
  # def index
  #   @requests = Request.all
  # end

  # GET /requests/1 or /requests/1.json
  def show
    respond_to do |format|
      format.html # default behavior
      format.json { render json: @request.slice(:id, :quantity) } # Return quantity as JSON
    end
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)
    @request.taker_id = current_user.id #if current_user.taker?
    Rails.logger.debug "Image attached?: #{params[:request][:image].present?}"

    respond_to do |format|
      if @request.save
        Rails.logger.debug "Saved with image: #{@request.image.attached?}"
        format.html { redirect_to request_url(@request), notice: "Request was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end  

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to request_url(@request), notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy!

    respond_to do |format|
      format.html { redirect_to requests_url, notice: "Request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def request_params
    #   params.require(:request).permit(
    #     :title, :description, :item_name, :quantity, :start_time, :end_time, :status, :image
    #   )
    # end

    private

    def request_params
      params.require(:request).permit(
        :title, :description, :item_name, :quantity, :address, :start_time, :end_time, :status, :image
      )
    end
    


    # Only admins and takers can access this controller
    def authorize_user
      puts "Current User: #{current_user.inspect}" # Check if user is set correctly
      puts "Current User Role: #{current_user.role}" # Check role directly
      
      if current_user.admin?
        puts "User is an admin"
      elsif current_user.giver?
        puts "User is a giver"
      elsif current_user.taker?
        puts "User is a taker"
      else
        puts "User is not recognized"
      end
      
      unless current_user.admin? || current_user.taker?
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
