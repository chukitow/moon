class Moon::ProductOptionType < ActiveRecord::Base
  belongs_to :product
  belongs_to :option_type
end
