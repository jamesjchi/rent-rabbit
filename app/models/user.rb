class User < ActiveRecord::Base
  has_many :item
  has_and_belongs_to_many :reviews

  validates :email, 
   			presence: true,
   			uniqueness: true
  
  # can't get email validator functionality to work		
  # validates :my_email_attribute, email: true

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
