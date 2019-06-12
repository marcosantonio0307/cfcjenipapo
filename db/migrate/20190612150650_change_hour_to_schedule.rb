class ChangeHourToSchedule < ActiveRecord::Migration[5.2]
  def change
  	change_column :schedules, :hour, :time
  end
end
