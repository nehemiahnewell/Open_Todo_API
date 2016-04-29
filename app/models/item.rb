class Item < ActiveRecord::Base
  belongs_to :list
  
  validates :description, length: { minimum: 1, maximum: 100 }, presence: true
  validates :list, presence: true
  
end
