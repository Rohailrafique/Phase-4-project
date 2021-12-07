class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :display_name, :image_url, :twitter_url, :facebook_url, :linkedin_url
end
