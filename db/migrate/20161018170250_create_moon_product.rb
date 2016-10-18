class CreateMoonProduct < ActiveRecord::Migration
  def change
    create_table :moon_products do |t|
      t.string     :name, null: false
      t.text       :description
      t.date       :available_on
      t.string     :meta_description
      t.string     :meta_keywords
      t.string     :meta_title
      t.integer    :master_price

      t.timestamps
    end
  end
end
