require 'spec_helper'

describe "spots/edit.html.erb" do
  before(:each) do
    @spot = assign(:spot, stub_model(Spot,
      :new_record? => false
    ))
  end

  it "renders the edit spot form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => spot_path(@spot), :method => "post" do
    end
  end
end
