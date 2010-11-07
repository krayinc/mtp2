require 'spec_helper'

describe NewsController do

  def mock_news(stubs={})
    (@mock_news ||= mock_model(News).as_null_object).tap do |news|
      news.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "assigns all news as @news" do
      News.stub(:all) { [mock_news] }
      get :index
      assigns(:news).should eq([mock_news])
    end
=end
  end

  describe "GET show" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "assigns the requested news as @news" do
      News.stub(:find).with("37") { mock_news }
      get :show, :id => "37"
      assigns(:news).should be(mock_news)
    end
=end
  end
end
