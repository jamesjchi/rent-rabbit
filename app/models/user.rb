class User < ActiveRecord::Base
  has_many :item, dependent: :destroy
  has_and_belongs_to_many :reviews

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
  			
  			confirmation: true
        # on: :create

  has_secure_password

  def self.authenticate email, password
  	User.find_by_email(email).try(:authenticate, password)
  end

end
