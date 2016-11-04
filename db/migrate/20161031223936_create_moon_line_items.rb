class CreateMoonLineItems < ActiveRecord::Migration
  def change
    create_table :moon_line_items do |t|
      t.references :order
      t.references :variant

      t.integer :unit_price
      t.integer :quantity
      t.integer :total

      t.timestamps
    end
  end
end
