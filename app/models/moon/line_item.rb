class Moon::LineItem < ActiveRecord::Base
  belongs_to :variant
  belongs_to :order

  validates_numericality_of :quantity, only_integer: true, greater_than: 0, less_than: 10000

  before_save :set_total_and_unit_price
  after_save :save_order

  def unit_price_formated
    Money.new(unit_price, "MXN").format
  end

  private

  def set_total_and_unit_price
    self.total = quantity * variant.price
    self.unit_price = variant.price
  end

  def save_order
    order.update_attributes(updated_at: Time.now)
  end
end
