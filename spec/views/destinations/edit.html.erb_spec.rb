require 'spec_helper'

describe "destinations/edit.html.erb" do
  before(:each) do
    @destination = assign(:destination, stub_model(Destination,
      :new_record? => false
    ))
  end

  it "renders the edit destination form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => destination_path(@destination), :method => "post" do
    end
  end
end
