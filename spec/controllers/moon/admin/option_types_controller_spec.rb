require 'spec_helper'

describe Moon::Admin::OptionTypesController, 'GET#index' do
  routes { Moon::Engine.routes }
  before { get :index }

  it 'retrieves all option types' do
    expect(assigns(:option_types)).to eq(Moon::OptionType.all)
  end

  it 'renders index template' do
    expect(response).to render_template(:index)
  end
end

describe Moon::Admin::OptionTypesController, 'GET#new' do
  routes        { Moon::Engine.routes }
  before        { get :new }

  it 'creates a new OptionType instance' do
    expect(assigns(:option_type)).to be_a_new(Moon::OptionType)
  end

  it 'renders new template' do
    expect(response).to render_template(:new)
  end
end

describe Moon::Admin::OptionTypesController, 'POST#create' do
  routes        { Moon::Engine.routes }

  context 'when request has valid params' do
    it 'redirects to edit admin option type path' do
      post :create, option_type: FactoryGirl.attributes_for(:option_type)

      expect(response).to redirect_to(edit_admin_option_type_path(assigns(:option_type)))
    end
  end

  context 'when request no has valid params' do
    it 'renders new tamplate' do
      post :create, option_type: FactoryGirl.attributes_for(:option_type, name: nil)

      expect(response).to render_template(:new)
    end
  end
end

describe Moon::Admin::OptionTypesController, 'GET#edit' do
  routes            { Moon::Engine.routes }
  let(:option_type) { FactoryGirl.create(:option_type) }
  before            { get :edit, id: option_type }

  it 'retrieves the requested option type' do
    expect(assigns(:option_type)).to eq(option_type)
  end

  it 'renders edit template' do
    expect(response).to render_template(:edit)
  end
end

describe Moon::Admin::OptionTypesController, 'PUT#update' do
  routes            { Moon::Engine.routes }
  let(:option_type) { FactoryGirl.create(:option_type) }

  context 'when request has valid params' do
    it 'redirects to edit admin option type path' do
      put :update, option_type: FactoryGirl.attributes_for(:option_type), id: option_type

      expect(response).to redirect_to(admin_option_types_path)
    end
  end

  context 'when request no has valid params' do
    it 'renders edit tamplate' do
      put :update, option_type: FactoryGirl.attributes_for(:option_type, name: nil), id: option_type

      expect(response).to render_template(:edit)
    end
  end
end

describe Moon::Admin::OptionTypesController, 'DELETE#destroy' do
  routes            { Moon::Engine.routes }
  let(:option_type) { FactoryGirl.create(:option_type) }

  it 'deletes the requested option type' do
    option_type # invoke factory

    expect{
      delete :destroy, id: option_type
    }.to change(Moon::OptionType, :count).by(-1)
  end
  it 'deletes the requested option type' do
    delete :destroy, id: option_type

    expect(response).to redirect_to(admin_option_types_path)
  end
end
