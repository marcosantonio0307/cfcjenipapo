class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :studant, foreign_key: true
      t.date :date_s
      t.time :hour_s

      t.timestamps
    end
  end
end
