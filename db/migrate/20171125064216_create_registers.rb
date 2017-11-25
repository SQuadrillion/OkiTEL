class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.string :name
      t.string :number
      t.integer :range
      t.datetime :time
      t.string :todo

      t.timestamps
    end
  end
end
