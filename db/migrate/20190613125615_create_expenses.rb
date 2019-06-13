class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.date :due_date
      t.decimal :price
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
