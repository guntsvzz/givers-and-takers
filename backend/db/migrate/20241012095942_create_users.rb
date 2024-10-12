class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :citizen_id
      t.string :organization_name
      t.string :organization_type, default: 'Non-Profit'
      t.integer :role, default: 0 # Enum will map this to integer values
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
