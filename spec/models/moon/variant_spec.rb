require 'spec_helper'

describe Moon::Variant do
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price) }
end

describe Moon::Variant, '.options_text' do
  let(:option_type)   { FactoryGirl.create(:option_type, presentation: 'Size') }
  let(:option_value)  { FactoryGirl.create(:option_value, option_type: option_type, presentation: 'L') }
  let(:variant)       { FactoryGirl.create(:variant, option_values: [option_value]) }

  it 'formats variant option values' do
    expect(variant.options_text).to eq("Size: L")
  end
end
