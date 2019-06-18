class CreateToDos < ActiveRecord::Migration[5.2]
  def change
    create_table :to_dos do |t|
      t.string :name, null: false
      t.date :due

      t.timestamps
    end
  end
end
