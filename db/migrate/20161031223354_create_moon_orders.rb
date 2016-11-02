class CreateMoonOrders < ActiveRecord::Migration
  def change
    create_table :moon_orders do |t|
      t.integer :subtotal
      t.integer :shipping
      t.integer :total
      t.integer :status

      t.timestamps
    end
  end
end
