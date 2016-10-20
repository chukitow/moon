class Moon::OptionType < ActiveRecord::Base
  has_many :option_values, -> { order(position: :asc) }, dependent: :destroy

  acts_as_list

  validates_presence_of :name, :presentation

  accepts_nested_attributes_for :option_values, reject_if: :all_blank, allow_destroy: true
end
