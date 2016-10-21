require 'faker'

FactoryGirl.define do
  factory :option_value, class: Moon::OptionValue do
    name          { Faker::Name.title }
    presentation  { Faker::Name.title }
  end
end
