class ReactionSerializer < ActiveModel::Serializer
  attributes :id, :like, :clap, :love, :dislike, :"no-test-framework"
  has_one :user
  has_one :post
end
