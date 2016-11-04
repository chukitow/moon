require 'faker'

FactoryGirl.define do
  factory :line_item, class: Moon::LineItem do
    unit_price { Faker::Number.number(4) }
    quantity   { Faker::Number.number(1) }
  end
end
