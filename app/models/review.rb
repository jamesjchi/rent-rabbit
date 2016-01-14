class Review < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :rating,
    presence: true,
    numericality: {
    	only_integer: true,
    	greater_than: 0,
    	less_than_or_equal_to: 5
    }

  validates :review,
    presence: true,
    length: {maximum: 501, too_long: "%{count} characters is the maximum allowed"}
    
end
