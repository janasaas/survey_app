class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #setup accessible (or protected) attributes for your model
   #attr_accessible :email, :password, :password_confirmation, :remember_me
  #validates :email, :encrypted_password, presence: true
  has_many :surveys
  
 end
