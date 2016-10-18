require 'spec_helper'

describe Moon::AlertsHelper, '.display_success_alert' do
  it 'displays alert content' do
    alert = helper.display_success_alert('My alert')
    expect(alert).to eq("<div class=\"alert alert-success\">My alert<button class=\"close\" aria-hidden=\"true\" data-dismiss=\"alert\">x</button></div>")
  end
end
