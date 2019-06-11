class CreatePortions < ActiveRecord::Migration[5.2]
  def change
    create_table :portions do |t|
      t.references :procedure, foreign_key: true
      t.date :due_date
      t.decimal :price

      t.timestamps
    end
  end
end
