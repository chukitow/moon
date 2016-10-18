require 'spec_helper'

describe Moon::Product do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:master_price) }
  it { should validate_numericality_of(:master_price) }
end
