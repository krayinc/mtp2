require 'spec_helper'

describe "spots/show.html.erb" do
  before(:each) do
    @spot = assign(:spot, stub_model(Spot))
  end

  it "renders attributes in <p>" do
    render
  end
end
