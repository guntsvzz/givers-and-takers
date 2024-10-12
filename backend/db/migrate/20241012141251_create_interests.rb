class CreateInterests < ActiveRecord::Migration[7.2]
  def change
    create_table :interests do |t|
      t.references :request, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.integer :delivery_method, default: 1, null: false

      t.timestamps
    end
  end
end
