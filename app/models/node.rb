class Node
  include Mongoid::Document
  field :title, :type => String
  field :slug_name, :type => String

  field :created_by, :type => String  #user object_id
  field :edited_by, :type => String #user object_id
  field :content_type, :type => String
  
  field :published_on, :type => Time, :default => Time.now
  field :updated_on, :type => Time, :default => Time.now
  field :created_on, :type => Time, :default => Time.now
  
  field :content_body, :type => String
  field :content_teaser, :type => String
  field :content_tags,  :type => Array
  field :content_taxonomy,  :type => Hash
  
  field :permissions, :type => Hash #maybe?
  
end
