class Article
  include Mongoid::Document
  field :name, :type => String
  field :title, :type => String
  field :author, :type => String
  field :content, :type => String
  field :tags,  :type => Array 
  field :published_on, :type => Time, :default => Time.now
  field :updated_on, :type => Time, :default => Time.now
  embeds_many :comments
  
#  def to_param 
 #   "#{name.gsub(/[^a-z0-9]+/i, '-')}"
 # end      
  
end

