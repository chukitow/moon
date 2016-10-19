require 'spec_helper'

describe Moon::Admin::ImagesController, 'GET#index' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }
  before        { get :index, product_id: product }

  it 'retrieves all product images' do
    expect(assigns(:images)).to eq(product.images)
  end

  it 'renders index template' do
    expect(response).to render_template(:index)
  end
end

describe Moon::Admin::ImagesController, 'GET#new' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }
  before        { get :new, product_id: product}

  it 'creates a new Asset instance' do
    expect(assigns(:image)).to be_a_new(Moon::Asset)
  end

  it 'renders new template' do
    expect(response).to render_template(:new)
  end
end

describe Moon::Admin::ImagesController, 'POST#create' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }

  context 'when request has valid params' do
    it 'redirects to admin product images path' do
      post :create, product_id: product, asset: FactoryGirl.attributes_for(:asset)

      expect(response).to redirect_to(admin_product_images_path(product))
    end
  end

  context 'when request no has valid params' do
    it 'renders new tamplate' do
      post :create, product_id: product, asset: FactoryGirl.attributes_for(:asset, attachment_file_name: nil)

      expect(response).to render_template(:new)
    end
  end
end

describe Moon::Admin::ImagesController, 'GET#edit' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }
  let(:image)   { FactoryGirl.create(:asset, viewable: product) }
  before        { get :edit, product_id: product, id: image }

  it 'retrieves the requested image' do
    expect(assigns(:image)).to eq(image)
  end

  it 'renders edit template' do
    expect(response).to render_template(:edit)
  end
end

describe Moon::Admin::ImagesController, 'PUT#update' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }
  let(:image)   { FactoryGirl.create(:asset, viewable: product) }

  it 'redirects to admin product images path' do
    put :update, asset: FactoryGirl.attributes_for(:asset), product_id: product, id: image

    expect(response).to redirect_to(admin_product_images_path(product))
  end
end

describe Moon::Admin::ImagesController, 'DELETE#destroy' do
  routes        { Moon::Engine.routes }
  let(:product) { FactoryGirl.create(:product) }
  let(:image)   { FactoryGirl.create(:asset, viewable: product) }

  it 'deletes the requested asset' do
    product # invoke factory
    image #invoke factory

    expect{
      delete :destroy, id: image, product_id: product
    }.to change(Moon::Asset, :count).by(-1)
  end
  it 'deletes the requested asset' do
    delete :destroy, id: image, product_id: product

    expect(response).to redirect_to(admin_product_images_path(product))
  end
end
