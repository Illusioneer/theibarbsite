class Article < ActiveRecord::Base

  after_save :cancel_cache

  def cancel_cache(id)
    Rails.cache.delete([self,"cache_article"])
  end

  def self.cache_find(id)
    logger.info id
    Rails.cache.fetch([self, "cache_article"]) { Article.find(id)}
  end

end