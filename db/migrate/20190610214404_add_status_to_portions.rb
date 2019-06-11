class AddStatusToPortions < ActiveRecord::Migration[5.2]
  def change
  	add_column :portions, :status, :string
  end
end
