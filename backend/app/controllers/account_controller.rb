class AccountController < ApplicationController
  before_action :authenticate_user!

  def settings
    @resource = current_user
    @resource_name = :user
    @devise_mapping = Devise.mappings[:user]
  end

  def giver
  end

  def taker
  end
end
