class AddDuedateToProcedure < ActiveRecord::Migration[5.2]
  def change
    add_column :procedures, :due_date, :date
  end
end
