class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Disable CSRF protection for API requests
  protect_from_forgery unless: -> { request.format.json? }
  # Preflight method to handle CORS preflight requests
  def preflight
    head :ok
  end
  
  def navbar
    render partial: 'shared/navbar'
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :organization_name, :organization_type, :phone_number, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :organization_name, :organization_type, :phone_number, :role])
  end
end
