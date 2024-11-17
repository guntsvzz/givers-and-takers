# app/controllers/users_controller.rb
class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    layout "application"
    # def index
    #   @user = current_user  # or User.find(params[:id]) if it's not the current user
    # end
    # Show action for displaying user details
    def show
      # The user object is already set by the before_action
    end

    def profile
      @user = User.find(params[:id])
    end

    # def givers
    #   @givers = User.where(role: 1).select(:id, :first_name, :last_name, :organization_name, :organization_type, :status) # Assuming 'role' is the attribute identifying giver users
    # end
    def givers
      @givers = User
        .where(role: 1)  # Filter for givers
        .left_joins(:interests)  # Join interests to get the quantity
        .group('users.id')  # Group by user to get the sum for each user
        .select('users.id, users.first_name, users.last_name, users.organization_name, users.organization_type, users.status, SUM(interests.quantity) AS total_interested_quantity')
        .order('total_interested_quantity DESC NULLS LAST')  # Explicitly ordering with NULL handling
        .page(params[:page]).per(10)  # Pagination, 10 users per page
    end    
  
    def takers
      # Start with users who have role 2 (you can change this condition based on your needs)
      @takers = User.where(role: 2)
                    .select(:id, :first_name, :last_name, :organization_name, :organization_type, :status)
                    .page(params[:page])  # Add pagination here
                    .per(10)               # 10 takers per page
    
      # Apply the status filter if any status checkboxes are selected
      if params[:status].present?
        @takers = @takers.where(status: params[:status].map(&:to_i))
      end
    
      # Order the takers by their status
      @takers = @takers.order(Arel.sql("CASE 
                                         WHEN status = 1 THEN 1
                                         WHEN status = 0 THEN 2
                                         ELSE 3 END"))
    end
        
    # def user_params
    #   params.require(:user).permit(:first_name, :last_name, :organization_name, :organization_type, :role, :email, :password)
    # end    

    # def your_account
    #   # Fetch the currently signed-in user
    #   @user = current_user
    # end

    private

    def set_user
      @user = User.find(params[:id]) # Assuming you are fetching the user by ID
    end
    
  end
  