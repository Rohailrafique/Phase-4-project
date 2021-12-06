class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :display_name, :password_digest, :image_url, :twitter_url, :facebook_url, :linkedin_url
end
