class Article < ActiveRecord::Base

  def self.cache_find(id)
    Rails.cache.fetch(self, "cache_article") { Article.find(id)}
  end

end
