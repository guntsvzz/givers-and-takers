class AddAddressToRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :requests, :address, :string
  end
end
