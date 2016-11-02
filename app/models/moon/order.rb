class Moon::Order < ActiveRecord::Base
  enum status: [:in_progress, :placed, :shipped, :completed]

  has_many :line_items, dependent: :destroy

  accepts_nested_attributes_for :line_items, reject_if: :all_blank

  before_save :set_subtotal

  def subtotal_formated
    Money.new(subtotal, "MXN").format
  end

  def add_line_item(line_items_params)
    line_item = line_items.find_by(variant: line_items_params[:variant_id])
    if line_item
      line_item.update(quantity: line_item.quantity + line_items_params[:quantity].to_i)
    else
      line_items.new(line_items_params)
      self.save
    end
  end

  private
  def set_subtotal
    self.subtotal = line_items.sum(:total)
  end
end
