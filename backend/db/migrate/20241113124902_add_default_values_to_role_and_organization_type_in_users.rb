class AddDefaultValuesToRoleAndOrganizationTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :role, from: nil, to: 1  # Assuming 1 corresponds to 'giver'
    change_column_default :users, :organization_type, from: nil, to: 0  # Assuming 0 corresponds to 'non_profit'
  end
end
