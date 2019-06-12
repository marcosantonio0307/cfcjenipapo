class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :studant, foreign_key: true
      t.date :date
      t.date :hour

      t.timestamps
    end
  end
end
