class Moon::OrdersController < Moon::ApplicationController
  before_action :set_order, only: [:update, :destroy]

  def index
    @order = current_order
  end

  def create
    @order = current_order
    @order.add_line_item(line_items_params)

    session[:moon_order_id] = @order.id

    redirect_to orders_path
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path
    else
      render :index
    end
  end

  def destroy
    line_item = @order.line_items.find(params[:line_item])
    line_item.destroy

    if @order.line_items.empty?
      @order.destroy
      session[:moon_order_id] = nil
    end

    redirect_to orders_path
  end

  private
  def line_items_params
    params.permit(:variant_id, :quantity)
  end

  def order_params
    params.require(:order).permit(line_items_attributes: [:id, :variant_id, :quantity, :_destroy])
  end

  def set_order
    @order = Moon::Order.find(params[:id])
  end
end
