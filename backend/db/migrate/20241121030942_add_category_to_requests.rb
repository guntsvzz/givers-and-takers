class AddCategoryToRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :requests, :category, :string
  end
end
