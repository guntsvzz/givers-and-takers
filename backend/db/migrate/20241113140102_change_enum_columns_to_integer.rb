class ChangeEnumColumnsToInteger < ActiveRecord::Migration[6.0]
  def up
    # Remove default values to prevent casting issues
    change_column_default :users, :role, nil
    change_column_default :users, :organization_type, nil
    change_column_default :users, :status, nil

    # Change column types to integer
    change_column :users, :role, :integer, using: 'role::integer', null: false
    change_column :users, :organization_type, :integer, using: 'organization_type::integer', null: false
    change_column :users, :status, :integer, using: 'status::integer', null: false

    # Set new default values
    change_column_default :users, :role, 0
    change_column_default :users, :organization_type, 0
    change_column_default :users, :status, 0
  end

  def down
    # Remove default values
    change_column_default :users, :role, nil
    change_column_default :users, :organization_type, nil
    change_column_default :users, :status, nil

    # Change column types back to string
    change_column :users, :role, :string, using: 'role::text', null: false
    change_column :users, :organization_type, :string, using: 'organization_type::text', null: false
    change_column :users, :status, :string, using: 'status::text', null: false
  end
end
