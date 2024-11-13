# db/migrate/[timestamp]_add_role_to_users.rb
class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    # Only set the default for the existing column
    change_column_default :users, :role, from: nil, to: 1

    # Uncomment the following line if you need to set a default for an existing column
    # change_column_default :users, :role, from: nil, to: 0
  end
end
