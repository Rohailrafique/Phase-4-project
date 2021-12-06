class UsersController < ApplicationController
    has_many :posts
    has_many :reactions
    has_many :comments
    has_many :followers
end
