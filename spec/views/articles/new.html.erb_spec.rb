require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      :title => "",
      :content => "",
      :metadata => ""
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_content[name=?]", "article[content]"

      assert_select "input#article_metadata[name=?]", "article[metadata]"
    end
  end
end
