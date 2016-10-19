class Moon::Admin::ImagesController < Moon::Admin::BaseController
  before_action :set_product
  before_action :set_image, only: [:edit, :update, :destroy]

  def index
    @images = @product.images
  end

  def new
    @image = @product.images.new
  end

  def create
    @image = @product.images.new(image_params)

    if @image.save
      redirect_to admin_product_images_path(@product), notice: 'Your image has been created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @image.update(image_params)
      redirect_to admin_product_images_path(@product), notice: 'Your image has been updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @image.destroy

    redirect_to admin_product_images_path(@product), notice: 'Your image has been deleted successfully.'
  end

  private
  def set_product
    @product = Moon::Product.find(params[:product_id])
  end

  def set_image
    @image = @product.images.find(params[:id])
  end

  def image_params
    params.require(:asset).permit(:alt, :attachment_file_name)
  end
end
