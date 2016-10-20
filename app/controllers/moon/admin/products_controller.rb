class Moon::Admin::ProductsController < Moon::Admin::BaseController

  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Moon::Product.all
  end

  def new
    @product = Moon::Product.new
  end

  def create
    @product = Moon::Product.new(product_params)

    if @product.save
      redirect_to edit_admin_product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to edit_admin_product_path(@product), notice: 'Your product has been successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy

    redirect_to admin_products_path, notice: 'Your product has been successfully deleted.'
  end

  private
  def set_product
    @product = Moon::Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :master_price, :available_on, :description, :meta_title,
      :meta_keywords, :meta_description, option_type_ids: []
    )
  end
end
