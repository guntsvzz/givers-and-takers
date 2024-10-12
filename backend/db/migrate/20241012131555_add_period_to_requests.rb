class AddPeriodToRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :requests, :start_time, :datetime
    add_column :requests, :end_time, :datetime
  end
end
