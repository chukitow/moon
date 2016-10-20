class CreateMoonOptionTypeAndOptionValues < ActiveRecord::Migration
  def change
    create_table :moon_option_types do |t|
      t.string  :name
      t.string  :presentation
      t.integer :position

      t.timestamps
    end

    create_table :moon_option_values do |t|
      t.references :option_type

      t.string  :name
      t.string  :presentation
      t.integer :position

      t.timestamps
    end

    create_table :moon_product_option_types do |t|
      t.references :product
      t.references :option_type

      t.integer    :position

      t.timestamps
    end
  end
end
