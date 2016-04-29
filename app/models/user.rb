class User < ActiveRecord::Base
  has_many :lists
   
  validates :username, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, length: { minimum: 1, maximum: 100 }, presence: true
end
