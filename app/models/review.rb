class Review < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :rating,
    presence: true,
    length: {in: 1..5}

  validates :review,
    presence: true,
    length: {maximum: 501, too_long: "%{count} characters is the maximum allowed"}
    
end
