class RenameDateToSchedule < ActiveRecord::Migration[5.2]
  def change
  	rename_column :schedules, :date, :date_s
  	rename_column :schedules, :hour, :hour_s
  end
end
