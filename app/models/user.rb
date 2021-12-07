class User < ApplicationRecord
    has_many :posts, dependent: :destroy 
    has_many :comments, dependent: :destroy 
    has_many :reactions, dependent: :destroy 
    has_many :followers, class_name: 'Follower', foreign_key: 'followed_id', dependent: :destroy
    has_many :followed_users, class_name: 'Follower', foreign_key: 'follower_id', dependent: :destroy

end
