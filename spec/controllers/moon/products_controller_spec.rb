require 'spec_helper'

describe Moon::ProductsController, 'GET#index' do
  routes { Moon::Engine.routes }
  before { get :index }

  it 'retrieves all available products' do
    expect(assigns(:products)).to eq(Moon::Product.available)
  end

  it 'renders index template' do
    expect(response).to render_template(:index)
  end
end

describe Moon::ProductsController, 'GET#show' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }
  before        { get :show, id: product }

  it 'retrieves the requested product' do
    expect(assigns(:product)).to eq(product)
  end

  it 'renders show template' do
    expect(response).to render_template(:show)
  end
end
