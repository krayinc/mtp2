require 'spec_helper'

describe "destinations/index.html.erb" do
  before(:each) do
    assign(:destinations, [
      stub_model(Destination),
      stub_model(Destination)
    ])
  end

  it "renders a list of destinations" do
    render
  end
end
