class CreateStudants < ActiveRecord::Migration[5.2]
  def change
    create_table :studants do |t|

      t.timestamps
    end
  end
end
