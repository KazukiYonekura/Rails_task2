class CreateRservesions < ActiveRecord::Migration[6.1]
  def change
    create_table :rservesions do |t|
      t.date :start
      t.date :end
      t.string :price

      t.timestamps
    end
  end
end
