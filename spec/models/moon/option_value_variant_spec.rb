require 'spec_helper'

describe Moon::OptionValueVariant do
  it { belong_to(:option_value) }
  it { belong_to(:variant) }
end
