class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  
  validates :permissions, inclusion: { in: %w(private viewable open), message: "%{value} is not private, viewable, or open" }
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :user, presence: true
  validates :permissions, length: { minimum: 1, maximum: 100 }, presence: true
end
