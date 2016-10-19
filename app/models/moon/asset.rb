class Moon::Asset < ActiveRecord::Base
  belongs_to :viewable, polymorphic: true

  acts_as_list scope: [:viewable_id, :viewable_type]

  validates_presence_of :attachment_file_name

  mount_uploader :attachment_file_name, Moon::AssetUploader
end
