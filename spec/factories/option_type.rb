require 'faker'

FactoryGirl.define do
  factory :option_type, class: Moon::OptionType do
    name          { Faker::Name.title }
    presentation  { Faker::Name.title }
  end
end
