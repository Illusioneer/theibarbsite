require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :title => "",
        :content => "",
        :metadata => ""
      ),
      Article.create!(
        :title => "",
        :content => "",
        :metadata => ""
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
