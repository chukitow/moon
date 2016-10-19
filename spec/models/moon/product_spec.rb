require 'spec_helper'

describe Moon::Product do
  it { should validate_presence_of(:name) }
end
