class AddImageUrlToRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :requests, :image_url, :string
  end
end
