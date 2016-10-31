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

describe Moon::Product, '.available' do
  it 'retrieves all available products' do
    FactoryGirl.create(:product, available_on: Date.tomorrow)
    FactoryGirl.create(:product, available_on: Date.today)

    expect(Moon::Product.available.count).to eq(1)
  end
end

describe Moon::Product, '.price_formated' do
  it 'retrieves price with format' do
    variant = FactoryGirl.create(:variant, is_master: true, price: 200)
    product = FactoryGirl.create(:product, variants: [variant])

    expect(product.price_formated).to eq('$2.00')
  end
end

describe Moon::Product, '.has_variants' do
  context 'when product has variants' do
    it 'returns true' do
      variant_master = FactoryGirl.create(:variant, is_master: true, price: 200)
      variant = FactoryGirl.create(:variant, price: 200)
      product = FactoryGirl.create(:product, variants: [variant_master, variant])

      expect(product.has_variants?).to be_truthy
    end
  end

  context 'when product no has variants' do
    it 'returns false' do
      variant_master = FactoryGirl.create(:variant, is_master: true, price: 200)
      product = FactoryGirl.create(:product, variants: [variant_master])

      expect(product.has_variants?).to be_falsy
    end
  end
end
