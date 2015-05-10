class Article < ActiveRecord::Base

  after_save :cancel_cache

  def cancel_cache
    logger.info "Removing cache key named: #{self} "
    Article.find(id).touch
  end

  def self.all_cache
    Rails.cache.fetch("all_articles") { Article.all}
  end

  def self.cache_find(id)
    logger.info "Finding id by #{Article.find(id).cache_key} "
    Rails.cache.fetch(Article.find(id).cache_key) { Article.find(id)}
  end

end