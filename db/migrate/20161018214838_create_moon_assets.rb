class CreateMoonAssets < ActiveRecord::Migration
  def change
    create_table :moon_assets do |t|
      t.integer  :viewable_id
      t.string   :viewable_type
      t.integer  :position
      t.text     :alt
      t.string   :attachment_file_name

      t.timestamps
    end
  end
end
