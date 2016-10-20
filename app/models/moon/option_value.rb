class Moon::OptionValue < ActiveRecord::Base
  belongs_to :option_type

  acts_as_list scope: :option_type

  validates_presence_of :name, :presentation
end
