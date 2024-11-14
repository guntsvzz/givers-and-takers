class ChangeEnumsToIntegersInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :role, :integer, using: 'role::integer', default: 0, null: false
    change_column :users, :organization_type, :integer, using: 'organization_type::integer', default: 0, null: false
    change_column :users, :status, :integer, using: 'status::integer', default: 0, null: false
  end
end
