class Moon::Admin::VariantsController < Moon::Admin::BaseController
  before_action :set_product
  before_action :set_variant, only: [:edit, :update, :destroy]

  def index
    @variants = @product.variants
  end

  def new
    @variant = @product.variants.new
  end

  def create
    @variant = @product.variants.new(variant_params)

    if @variant.save
      redirect_to admin_product_variants_path(@product), notice: 'Your variant has been successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @variant.update(variant_params)
      redirect_to admin_product_variants_path(@product), notice: 'Your variant has been successfully updated.'
    else
      render :new
    end
  end

  def delete
    @variant.destroy

    redirect_to admin_product_variants_path(@product), notice: 'Your variant has been successfully deleted.'
  end

  private
  def set_product
    @product = Moon::Product.includes(:variants).find(params[:product_id])
  end

  def set_variant
    @variant = @product.variants.find(params[:id])
  end

  def variant_params
    params.require(:variant).permit(:name, :sku, :price)
  end
end
