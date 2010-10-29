require 'spec_helper'

describe "spots/index.html.erb" do
  before(:each) do
    assign(:spots, [
      stub_model(Spot),
      stub_model(Spot)
    ])
  end

  it "renders a list of spots" do
    render
  end
end
