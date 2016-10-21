require 'spec_helper'

describe Moon::Asset do
  it { belong_to(:viewable) }

  it { validate_presence_of(:attachment_file_name) }
end
