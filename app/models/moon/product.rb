class Moon::Product < ActiveRecord::Base
  has_many :images, as: :viewable, class_name: 'Moon::Asset'
  has_many :product_option_types
  has_many :option_types, through: :product_option_types

  validates_presence_of :name, :master_price
  validates_numericality_of :master_price, only_integer: true, greater_than_or_equal_to: 0

  accepts_nested_attributes_for :option_types, allow_destroy: true
end
