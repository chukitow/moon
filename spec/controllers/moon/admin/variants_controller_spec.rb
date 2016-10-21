require 'spec_helper'

describe Moon::Admin::VariantsController, 'GET#index' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }
  before        { get :index, product_id: product }

  it 'retrieves all product variants' do
    expect(assigns(:variants)).to eq(product.variants.not_master)
  end

  it 'renders index template' do
    expect(response).to render_template(:index)
  end
end

describe Moon::Admin::VariantsController, 'GET#new' do
  routes             { Moon::Engine.routes }
  let(:option_value) { FactoryGirl.create(:option_value) }
  let(:option_type)  { FactoryGirl.create(:option_type, option_values: [option_value]) }
  let(:product)      { FactoryGirl.create(:product, option_types: [option_type]) }
  before             { get :new, product_id: product}

  it 'creates a new Variant instance' do
    expect(assigns(:variant)).to be_a_new(Moon::Variant)
  end

  it 'renders new template' do
    expect(response).to render_template(:new)
  end
end

describe Moon::Admin::VariantsController, 'POST#create' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }

  context 'when request has valid params' do
    it 'redirects to admin product variants path' do
      post :create, product_id: product, variant: FactoryGirl.attributes_for(:variant)

      expect(response).to redirect_to(admin_product_variants_path(product))
    end
  end

  context 'when request no has valid params' do
    it 'renders new tamplate' do
      post :create, product_id: product, variant: FactoryGirl.attributes_for(:variant, price: nil)

      expect(response).to render_template(:new)
    end
  end
end

describe Moon::Admin::VariantsController, 'GET#edit' do
  routes          { Moon::Engine.routes }
  let(:product)   { FactoryGirl.create(:product) }
  let(:variant)   { FactoryGirl.create(:variant, product: product) }
  before          { get :edit, product_id: product, id: variant }

  it 'retrieves the requested variant' do
    expect(assigns(:variant)).to eq(variant)
  end

  it 'renders edit template' do
    expect(response).to render_template(:edit)
  end
end

describe Moon::Admin::VariantsController, 'PUT#update' do
  routes          { Moon::Engine.routes }
  let(:product)   { FactoryGirl.create(:product) }
  let(:variant)   { FactoryGirl.create(:variant, product: product) }

  it 'redirects to admin product variants path' do
    put :update, variant: FactoryGirl.attributes_for(:variant), product_id: product, id: variant

    expect(response).to redirect_to(admin_product_variants_path(product))
  end
end

describe Moon::Admin::VariantsController, 'DELETE#destroy' do
  routes          { Moon::Engine.routes }
  let(:product)   { FactoryGirl.create(:product) }
  let(:variant)   { FactoryGirl.create(:variant, product: product) }

  it 'deletes the requested variant' do
    product # invoke factory
    variant #invoke factory

    expect{
      delete :destroy, id: variant, product_id: product
    }.to change(Moon::Variant, :count).by(-1)
  end
  it 'redirects to admin product variants path' do
    delete :destroy, id: variant, product_id: product

    expect(response).to redirect_to(admin_product_variants_path(product))
  end
end
