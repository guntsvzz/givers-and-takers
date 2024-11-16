# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # skip_before_action :verify_authenticity_token, only: [:create]
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @selected_role = params[:role]
    @show_role_selection = @selected_role.nil?
    puts "Role param: #{params[:role]}" # Debug log
    super
  end

  # POST /resource
  def create
    # if params[:role] == 'giver'
    #   params[:user][:role] = User.roles[:giver]
    # elsif params[:role] == 'taker'
    #   params[:user][:role] = User.roles[:taker]
    # end
    
    # Convert role string to integer based on enum
    if sign_up_params[:role] == 'giver'
      params[:user][:role] = User.roles[:giver]
    else
      params[:user][:role] = User.roles[:taker]
    end

    # Ensure `organization_type` is set if it's coming from params
    params[:user][:organization_type] ||= User.organization_types[:non_profit] # Set a default if needed
    
    super
  end

  # def create
  #   # Convert role string to integer based on enum
  #   if sign_up_params[:role] == 'giver'
  #     params[:user][:role] = User.roles[:giver]
  #   else
  #     params[:user][:role] = User.roles[:taker]
  #   end
    
  #   super
  # end

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

  protected

  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params.except(:current_password))
    else
      resource.update_with_password(params)
    end
  end

  def after_update_path_for(resource)
    profile_path(resource) # Redirects to the profile page
  end
  
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
  # def encode_token(payload)
  #   JWT.encode(payload, Rails.application.credentials.secret_key_base)
  # end 
  
  # private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :organization_name, :phone_number)
    # Do not permit :role, :organization_type, or :status if they shouldn't be set via params
  end

  # def sign_up_params
  #   params.require(:user).permit(
  #     :first_name, 
  #     :last_name, 
  #     :email, 
  #     :password,
  #     :password_confirmation, 
  #     :address,
  #     :role, 
  #     :organization_type, 
  #     :organization_name, 
  #     :phone_number
  #   )
  # end  
end
