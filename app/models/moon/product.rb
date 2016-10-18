class Moon::Product < ActiveRecord::Base
  validates_presence_of :name, :master_price
  validates_numericality_of :master_price, only_integer: true, greater_than_or_equal_to: 0
end
