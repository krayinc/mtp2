require 'spec_helper'

describe "plans/index.html.erb" do
  before(:each) do
    assign(:plans, [
      stub_model(Plan),
      stub_model(Plan)
    ])
  end

  it "renders a list of plans" do
    render
  end
end
