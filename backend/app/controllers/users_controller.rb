# app/controllers/users_controller.rb
class UsersController < ApplicationController

    # def index
    #   @user = current_user  # or User.find(params[:id]) if it's not the current user
    # end

    def givers
      @givers = User.where(role: 1).select(:id, :first_name, :last_name, :organization_name, :organization_type, :status) # Assuming 'role' is the attribute identifying giver users
    end
  
    def takers
      @takers = User.where(role: 2).select(:id, :first_name, :last_name, :organization_name, :organization_type, :status)
    end
        
    # def user_params
    #   params.require(:user).permit(:first_name, :last_name, :organization_name, :organization_type, :role, :email, :password)
    # end    

    # def your_account
    #   # Fetch the currently signed-in user
    #   @user = current_user
    # end
  end
  