class User
  include Mongoid::Document
#  field :provider, :type => String
  field :user_id, :type => String
  field :name, :type => String
  field :email, :type => String

  embeds_many :authorizations
  validates :name, :email, :presence => true

#  def self.create_with_omniauth(auth)
#    create! do |user|
#      user.provider = auth['provider']
#      user.uid = auth['uid']
#      if auth['info']
#         user.name = auth['info']['name'] || ""
#         user.email = auth['info']['email'] || ""
#      end
#    end
#  end

  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end
end

