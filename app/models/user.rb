class User < ActiveRecord::Base
  has_many :item, dependent: :destroy
  has_and_belongs_to_many :reviews, dependent: :destroy

  validates :email,
        email: true,
   			presence: true,
   			uniqueness: true

  validates :first_name, :last_name,
  			presence: true

  validates :password,
  			presence: true,
        length: {
          minimum: 5,
          maximum: 20,
          too_short: " must be at least %{count} characters",
          too_long: " can have no more than %{count} characters"
        },

  			confirmation: true,
        on: :create

  has_secure_password

  def self.authenticate email, password
  	User.find_by_email(email).try(:authenticate, password)
  end

  def avg_rating person
    user_reviews = Review.select {|r| r.reviewer_id === person.id}
    puts user_reviews
  end

  def set_password_reset
    self.reset_code = SecureRandom.urlsafe_base64
    self.expires_at = 4.hours.from_now
    self.save!
  end
end
