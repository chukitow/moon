class Moon::Product < ActiveRecord::Base
  has_many :images, as: :viewable, class_name: 'Moon::Asset'

  validates_presence_of :name, :master_price
  validates_numericality_of :master_price, only_integer: true, greater_than_or_equal_to: 0
end
