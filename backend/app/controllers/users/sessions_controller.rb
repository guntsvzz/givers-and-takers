# frozen_string_literal: true

# require 'jwt'

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @show_role_selection = true
    super
  end

  # POST /resource/sign_in
  def create
    @selected_role = params[:user][:role] # Get the role from the form data
    super
  end
  

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    super do
      # Redirect after logout to a specific page (e.g., home page)
      redirect_to root_path and return
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  # respond_to :json

  # # Prevent CSRF verification on JSON requests
  # skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  private

  def respond_to_on_destroy
    head :no_content
  end

  # def respond_with(resource, _opts = {})
  #   token = encode_token(user_id: resource.id)  # Generate the token
  #   render json: { message: 'Logged in successfully.', user: resource, token: token }, status: :ok
  # end

  # def encode_token(payload)
  #   JWT.encode(payload, Rails.application.credentials.secret_key_base)
  # end
end
