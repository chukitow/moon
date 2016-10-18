require 'faker'

FactoryGirl.define do
  factory :product, class: Moon::Product do
    name          { Faker::Name.title }
    master_price  { Faker::Number.number(5) }
  end
end
