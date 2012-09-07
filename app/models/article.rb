class Article
  include Mongoid::Document
  field :name, :type => String
  field :title, :type => String
  field :title_slug, :type => String
  field :author, :type => String
  field :content, :type => String, :label => "Content", :subtype => "textbox"
  field :tags,  :type => Array 
  field :published_on, :type => Time, :default => Time.now
  field :updated_on, :type => Time, :default => Time.now
  field :image, :type => String
  embeds_many :comments

#  mount_uploader :image, ImageUploader
  
#  def to_param 
 #   "#{name.gsub(/[^a-z0-9]+/i, '-')}"
 # end      
  
end

