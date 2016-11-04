require 'spec_helper'

describe Moon::OrdersController, 'GET#index' do
  routes      { Moon::Engine.routes }

  context 'when order is in session' do
    let(:order) { FactoryGirl.create(:order) }
    before do
      session[:moon_order_id] = order.id

      get :index
    end

    it 'retrieves the order in session' do
      expect(assigns(:order)).to eq(order)
    end
  end

  context 'when order is not in session' do
    before { get :index }
    it 'retrieves a new order' do
      expect(assigns(:order)).to be_a_new(Moon::Order)
    end
  end
end

describe Moon::OrdersController, 'POST#create' do
  routes      { Moon::Engine.routes }
  let(:order) { FactoryGirl.create(:order) }
  before      { session[:moon_order_id] = order. id }

  context 'when adding line item with a variant that already exists' do
    it 'updates line item quantity and total' do
      variant = FactoryGirl.create(:variant)
      line_item = FactoryGirl.create(:line_item, variant: variant, quantity: 4, order: order)
      order.add_line_item(line_item)

      post :create, variant_id: variant.id, quantity: 4

      expect(order.reload.line_items.count).to be(1)
    end
  end

  context 'when adding line item with a variant that doesn\'t exist' do
    it 'adds the new line item' do
      variant = FactoryGirl.create(:variant)
      new_variant = FactoryGirl.create(:variant)
      line_item = FactoryGirl.create(:line_item, variant: variant, quantity: 4, order: order)
      order.add_line_item(line_item)

      post :create, variant_id: new_variant.id, quantity: 4

      expect(order.reload.line_items.count).to be(2)
    end
  end
end

describe Moon::OrdersController, 'PUT#update' do
  routes      { Moon::Engine.routes }
  let(:order) { FactoryGirl.create(:order) }
  before      { session[:moon_order_id] = order. id }

  context 'when request has valid params' do
    it 'updates order cart' do
      variant = FactoryGirl.create(:variant)
      line_item = FactoryGirl.create(:line_item, variant: variant, quantity: 4, order: order)
      order.add_line_item(line_item)

      put :update, id: order, order: { line_items_attributes: [{variant_id: variant.id, quantity: 1}] }

      expect(order.line_items.count).to eq(2)
    end
  end
end

describe Moon::OrdersController, 'DELETE#destroy' do
  routes      { Moon::Engine.routes }
  let(:order) { FactoryGirl.create(:order) }
  before      { session[:moon_order_id] = order. id }

  context 'when is last line item' do
    it 'deletes the order' do
      variant = FactoryGirl.create(:variant)
      line_item = FactoryGirl.create(:line_item, variant: variant, quantity: 4, order: order)
      order.add_line_item(line_item)

      expect{
        delete :destroy, id: order, line_item: line_item.id
      }.to change(Moon::Order, :count).by(-1)
    end
  end

  context 'when is not last line item' do
    it 'deletes just the line item' do
      variant = FactoryGirl.create(:variant)
      other_variant = FactoryGirl.create(:variant)
      line_item = FactoryGirl.create(:line_item, variant: variant, quantity: 4, order: order)
      other_line_item = FactoryGirl.create(:line_item, variant: other_variant, quantity: 4, order: order)
      order.add_line_item(line_item)
      order.add_line_item(other_line_item)

      delete :destroy, id: order, line_item: line_item.id

      expect(order.line_items.count).to eq(1)
    end
  end
end
