class Item < ActiveRecord::Base
  belongs_to :user

  validates :title, 
    presence: true,
    length: {in: 1..100}

  validates :description,
    presence: true,
    length: {maximum: 256, too_long: "%{count} characters is the maximum allowed"}

  validates :price_day,
    :presence => true, :if => "price_week.nil?",
    numericality: {only_integer: true}
   
  validates :price_week,
    :presence => true, :if => "price_day.nil?",
    numericality: {only_integer: true}

  validates :start_date,
    presence: true

  validates :end_date,
    presence: true

    def self.search(query)
      # if query.blank?
      #   scoped
      # else
        q = "%#{query}%"
        where("title ILIKE ? or description ILIKE ?", q, q)
      # where("title ILIKE ?", "%#{search}%")
      # where("description ILIKE ?", "%#{search}%")    
    end

    def after_initialize
      if new_record?
        rented ||= false
      end
    end

end
