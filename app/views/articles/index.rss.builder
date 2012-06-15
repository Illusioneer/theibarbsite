xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "My Blog has a first name..."
    xml.description "A blog about bloggers."
    xml.link articles_url

    for article in @articles
      xml.item do
        xml.title article.name
        xml.description article.content
        xml.pubDate article.published_on.to_s
      end
    end
  end
end
