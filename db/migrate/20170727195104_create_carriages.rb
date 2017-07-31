class CreateCarriages < ActiveRecord::Migration[5.1]
  def change
    create_table :carriages do |t|
      t.belongs_to :train, index: true
      t.integer :bottom_seats, default: 0
      t.integer :top_seats, default: 0
      t.string :type_class, null: false

      t.timestamps
    end
  end
end
