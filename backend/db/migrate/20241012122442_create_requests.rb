class CreateRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :requests do |t|
      t.string :request_id
      t.integer :taker_id
      t.string :image
      t.text :description
      t.string :item_name
      t.integer :quantity
      t.integer :status

      t.timestamps
    end
  end
end
