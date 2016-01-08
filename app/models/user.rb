class User < ActiveRecord::Base
  has_many :item
  has_and_belongs_to_many :reviews
end
