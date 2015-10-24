class Topic < ActiveRecord::Base
    has_many :posts
    has_many :post, dependent: :destroy
end