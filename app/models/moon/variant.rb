class Moon::Variant < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :price
  validates_numericality_of :price, only_integer: true, greater_than_or_equal_to: 0
end
