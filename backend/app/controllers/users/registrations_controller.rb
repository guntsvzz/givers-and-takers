# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: [:create]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end
  def create
    super do |resource|
      # After the user is successfully created, generate a token and include it in the response
      token = encode_token(user_id: resource.id) if resource.persisted?
      render json: { message: 'User created successfully.', user: resource, token: token }, status: :created and return if resource.persisted?
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name, 
      :last_name, 
      :email, 
      :password, 
      :password_confirmation, 
      :address, 
      :role, 
      :organization_type, 
      :organization_name, 
      :phone_number
    ])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def sign_up_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :email, 
      :password,
      :password_confirmation, 
      :address,
      :role, 
      :organization_type, 
      :organization_name, 
      :phone_number)
  end
end
