class User < ActiveRecord::Base
  has_many :item
  has_and_belongs_to_many :reviews

  validates :email, 
        email: true,
   			presence: true,
   			uniqueness: true	
  
  validates :first_name, :last_name,
  			presence: true

  validates :password,
  			presence: true,
  			confirmation: true

  has_secure_password

  def self.authenticate email, password
  	User.find_by_email(email).try(:authenticate, password)
  end

end
