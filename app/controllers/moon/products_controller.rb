class Moon::ProductsController < Moon::ApplicationController
  def index
    @products = Moon::Product.available
  end

  def show
    @product = Moon::Product.includes(:variants).find(params[:id])
  end
end
