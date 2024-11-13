class AddStatusToInterests < ActiveRecord::Migration[7.2]
  def change
    add_column :interests, :status, :string
  end
end
