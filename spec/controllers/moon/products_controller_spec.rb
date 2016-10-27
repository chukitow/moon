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
