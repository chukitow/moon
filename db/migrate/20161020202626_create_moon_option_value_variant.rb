class CreateMoonOptionValueVariant < ActiveRecord::Migration
  def change
    create_table :moon_option_value_variants do |t|
      t.references :variant
      t.references :option_value
    end
  end
end
