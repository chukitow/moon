class Moon::Variant < ActiveRecord::Base
  has_many :option_value_variants
  has_many :option_values, through: :option_value_variants

  belongs_to :product

  accepts_nested_attributes_for :option_values, allow_destroy: true

  validates_presence_of :price
  validates_numericality_of :price, only_integer: true, greater_than_or_equal_to: 0

  scope :not_master, -> { where(is_master: false) }

  def options_text
    values = self.option_values.sort do |a, b|
      a.option_type.position <=> b.option_type.position
    end

    values.to_a.map! do |ov|
      "#{ov.option_type.presentation}: #{ov.presentation}"
    end

    values.to_sentence({ words_connector: ", ", two_words_connector: ", " })
  end

  def price_formated
    Money.new(price, "MXN").format
  end
end
