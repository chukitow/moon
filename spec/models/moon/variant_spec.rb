require 'spec_helper'

describe Moon::Variant do
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price) }
end
