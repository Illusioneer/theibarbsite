require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :title => "",
      :content => "",
      :metadata => ""
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_content[name=?]", "article[content]"

      assert_select "input#article_metadata[name=?]", "article[metadata]"
    end
  end
end
