xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Your Blog Title"
    xml.description "A blog about software and chocolate"
    xml.link articles_url

    for article in @articles
      xml.item do
        xml.title article.title
        xml.description article.content
        xml.pubDate article.published_on.to_s(:rfc822)
        xml.author article.author ||= "Unlisted Author"
        #xml.link post_url(article)
        #xml.guid post_url(article)
      end
    end
  end
end

