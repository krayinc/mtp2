require 'spec_helper'

describe "plans/new.html.erb" do
  before(:each) do
    assign(:plan, stub_model(Plan).as_new_record)
  end

  it "renders new plan form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => plans_path, :method => "post" do
    end
  end
end
