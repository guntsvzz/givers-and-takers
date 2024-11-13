class AddDonatesToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :donates, :integer
  end
end
