class Moon::Admin::OptionTypesController < Moon::Admin::BaseController
  before_action :set_option_type, only: [:edit, :update, :destroy]

  def index
    @option_types = Moon::OptionType.all
  end

  def new
    @option_type = Moon::OptionType.new
  end

  def create
    @option_type = Moon::OptionType.new(option_type_params)

    if @option_type.save
      redirect_to edit_admin_option_type_path(@option_type), notice: 'Your option type has been created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @option_type.update(option_type_params)
      redirect_to admin_option_types_path, notice: 'Your option type has been updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @option_type.destroy

    redirect_to admin_option_types_path, notice: 'Your option type has been deleted successfully.'
  end

  private

  def set_option_type
    @option_type = Moon::OptionType.find(params[:id])
  end

  def option_type_params
    params.require(:option_type).permit(
      :name, :presentation, option_values_attributes: [:id, :name, :presentation, :_destroy]
    )
  end
end
