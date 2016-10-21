require 'spec_helper'

describe Moon::OptionValue do
  it { belong_to(:option_type) }

  it { validate_presence_of(:name) }
  it { validate_presence_of(:presentation) }
end
