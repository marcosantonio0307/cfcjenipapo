class AddColumnToStudants < ActiveRecord::Migration[5.2]
  def change
    add_column :studants, :name, :string
    add_column :studants, :cpf, :string
    add_column :studants, :address, :string
    add_column :studants, :district, :string
    add_column :studants, :city, :string
    add_column :studants, :fone, :string
  end
end
