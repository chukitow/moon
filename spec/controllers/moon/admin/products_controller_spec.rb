require 'spec_helper'

describe Moon::Admin::ProductsController, 'GET#index' do
  routes { Moon::Engine.routes }
  before { get :index }

  it 'retrieves all products' do
    expect(assigns(:products)).to eq(Moon::Product.all)
  end

  it 'renders index template' do
    expect(response).to render_template(:index)
  end
end

describe Moon::Admin::ProductsController, 'GET#new' do
  routes        { Moon::Engine.routes }
  before        { get :new }

  it 'creates a new Product instance' do
    expect(assigns(:product)).to be_a_new(Moon::Product)
  end

  it 'renders new template' do
    expect(response).to render_template(:new)
  end
end

describe Moon::Admin::ProductsController, 'POST#create' do
  routes        { Moon::Engine.routes }

  context 'when request has valid params' do
    it 'redirects to edit admin product path' do
      post :create, product: FactoryGirl.attributes_for(:product)

      expect(response).to redirect_to(edit_admin_product_path(assigns(:product)))
    end
  end

  context 'when request no has valid params' do
    it 'renders new tamplate' do
      post :create, product: FactoryGirl.attributes_for(:product, name: nil)

      expect(response).to render_template(:new)
    end
  end
end

describe Moon::Admin::ProductsController, 'GET#edit' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }
  before        { get :edit, id: product }

  it 'retrieves the requested product' do
    expect(assigns(:product)).to eq(product)
  end

  it 'renders edit template' do
    expect(response).to render_template(:edit)
  end
end

describe Moon::Admin::ProductsController, 'PUT#update' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }

  context 'when request has valid params' do
    it 'redirects to edit admin product path' do
      put :update, product: FactoryGirl.attributes_for(:product), id: product

      expect(response).to redirect_to(edit_admin_product_path(assigns(:product)))
    end
  end

  context 'when request no has valid params' do
    it 'renders edit tamplate' do
      put :update, product: FactoryGirl.attributes_for(:product, name: nil), id: product

      expect(response).to render_template(:edit)
    end
  end
end

describe Moon::Admin::ProductsController, 'DELETE#destroy' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }

  it 'deletes the requested product' do
    product # invoke factory

    expect{
      delete :destroy, id: product
    }.to change(Moon::Product, :count).by(-1)
  end
  it 'deletes the requested product' do
    delete :destroy, id: product

    expect(response).to redirect_to(admin_products_path)
  end
end
