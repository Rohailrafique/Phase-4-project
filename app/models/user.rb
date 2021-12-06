class User < ApplicationRecord
    has_many :posts, dependent: :destroy 
    has_many :followers, dependent: :destroy 
    has_many :comments, dependent: :destroy 
    has_many :reactions, dependent: :destroy 


end
