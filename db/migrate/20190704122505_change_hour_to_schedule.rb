class ChangeHourToSchedule < ActiveRecord::Migration[5.2]
  def change
  	change_column :schedules, :hour_s, :string
  end
end
