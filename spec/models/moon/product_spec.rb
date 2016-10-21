require 'spec_helper'

describe Moon::Product do
  it { should validate_presence_of(:name) }
end

describe Moon::Product, '.empty_option_values?' do
  let(:option_value)  { FactoryGirl.create(:option_value, presentation: 'L') }
  let(:option_type)   { FactoryGirl.create(:option_type, presentation: 'Size', option_values: [option_value]) }

  context 'when has option values' do

    it 'returns true' do
      product =  FactoryGirl.create(:product)
      product.option_types << option_type
      expect(product.empty_option_values?).to be_falsy
    end
  end

  context 'when no has option values' do
    it 'returns false' do
      product =  FactoryGirl.create(:product)
      expect(product.empty_option_values?).to be_truthy
    end
  end
end
