class Comment
  include Mongoid::Document
  field :name, :type => String
  field :content, :type => String
  field :user_id, :type => String
  field :published_on, :type => Time, :default => Time.now
  field :updated_on, :type => Time, :default => Time.now
  embedded_in :article, :inverse_of => :comments
end
