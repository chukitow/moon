require 'faker'

FactoryGirl.define do
  factory :asset, class: Moon::Asset do
    attachment_file_name { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'logo_image.jpg')) }
    alt                  { Faker::Name.title }
  end
end
