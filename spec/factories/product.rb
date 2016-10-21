require 'faker'

FactoryGirl.define do
  factory :product, class: Moon::Product do
    name          { Faker::Name.title }
  end
end
