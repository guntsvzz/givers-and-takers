class CreateJsonFiles < ActiveRecord::Migration[7.2]
  def change
    create_table :json_files do |t|
      t.string :name
      t.string :file_path

      t.timestamps
    end
  end
end
