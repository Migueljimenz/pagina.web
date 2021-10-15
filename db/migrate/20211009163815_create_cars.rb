class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :modelo
      t.string :placa
      t.string :color

      t.timestamps
    end
  end
end
