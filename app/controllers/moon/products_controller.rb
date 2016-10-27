class Moon::ProductsController < Moon::ApplicationController
  def index
    @products = Moon::Product.available
  end
end
