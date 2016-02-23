require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :mutts, foreign_key: :owner_id
  has_many :guesses, class_name: :Breed, foreign_key: :user_id

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_hash, presence: true

  def password
   @password ||= Password.new(password_hash)
   end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password_hash == password
      user
    end
  end

end
