class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  
  validates :permissions, inclusion: { in: %w(private viewable open), message: "%{value} is not private, viewable, or open" }
end
