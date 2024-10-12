class AddTitleToRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :requests, :title, :string
  end
end
