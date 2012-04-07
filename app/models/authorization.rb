class Authorization
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  field :user_id, :type => String

  attr_accessible :provider, :uid, :user_id

  embedded_in :user, :inverse_of => :authorizations
  validates :provider, :uid, :presence => true

  def self.find_or_create(auth_hash)
    unless auth = self.where(provider: auth_hash["provider"], uid: auth_hash["uid"])
#    unless auth = self.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      auth = User.new :name => auth_hash["extra"]["name"], :email => auth_hash["extra"]["email"]
      new_provider = Authorization.new :user_id => "47", :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      auth.authorizations << new_provider
    end
    return auth
  end

end
