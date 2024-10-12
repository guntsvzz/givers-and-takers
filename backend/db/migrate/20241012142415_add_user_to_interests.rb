class AddUserToInterests < ActiveRecord::Migration[7.2]
  def change
    add_reference :interests, :user, null: false, foreign_key: true
  end
end
