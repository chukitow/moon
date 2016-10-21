require 'spec_helper'

describe Moon::OptionType do
  it { have_many(:option_values) }
  it { have_many(:product_option_types) }

  it { validate_presence_of(:name) }
  it { validate_presence_of(:presentation) }

  it { accept_nested_attributes_for(:option_values)}
end
