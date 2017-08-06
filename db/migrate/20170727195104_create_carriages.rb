class CreateCarriages < ActiveRecord::Migration[5.1]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.integer :bottom_seats, default: 0
      t.integer :top_seats, default: 0
      t.integer :side_top_seats, default: 0
      t.integer :side_bottom_seats, default: 0
      t.integer :chair_seats, default: 0

      t.string :type
      t.belongs_to :train, index: true

      t.timestamps
    end
  end
end
