class Moon::Product < ActiveRecord::Base
  has_many :images, as: :viewable, class_name: 'Moon::Asset'
  has_many :product_option_types
  has_many :option_types, through: :product_option_types
  has_many :variants, dependent: :destroy

  accepts_nested_attributes_for :option_types, allow_destroy: true
  accepts_nested_attributes_for :variants, reject_if: :all_blank

  validates_presence_of :name

  alias options :product_option_types

  def master_variant
    variants.find_by(is_master: true)
  end

  def empty_option_values?
   options.empty? || !option_types
                      .joins("LEFT OUTER JOIN #{Moon::OptionValue.table_name} ON #{Moon::OptionValue.table_name}.option_type_id = #{Moon::OptionType.table_name}.id")
                      .where("#{Moon::OptionValue.table_name}.id IS NULL").empty?
  end
end
