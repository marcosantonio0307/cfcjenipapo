class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.string :number
      t.references :studant, foreign_key: true
      t.string :category
      t.decimal :class_a
      t.decimal :class_b
      t.decimal :class_t
      t.string :status

      t.timestamps
    end
  end
end
