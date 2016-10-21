require 'faker'

FactoryGirl.define do
  factory :variant, class: Moon::Variant do
    sku   { Faker::Number.number(3) }
    price { Faker::Number.number(4) }
  end
end
