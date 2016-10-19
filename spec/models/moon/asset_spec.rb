require 'spec_helper'

describe Moon::Asset do
  it { validate_presence_of(:attachment_file_name) }
end
