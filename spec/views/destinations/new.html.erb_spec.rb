require 'spec_helper'

describe "destinations/new.html.erb" do
  before(:each) do
    assign(:destination, stub_model(Destination).as_new_record)
  end

  it "renders new destination form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => destinations_path, :method => "post" do
    end
  end
end
