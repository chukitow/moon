class CreateMoonVariant < ActiveRecord::Migration
  def change
    create_table :moon_variants do |t|
      t.references :product
      t.string     :name
      t.string     :sku
      t.boolean    :is_master, defualt: false
      t.integer    :position
      t.integer    :price

      t.timestamps
    end

    remove_column :moon_products, :master_price # price is given in master variant
  end
end
