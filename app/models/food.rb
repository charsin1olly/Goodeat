class Food < ApplicationRecord
  acts_as_paranoid
  
  validates :title , presence: true
  validates :price , presence: true
  validates :description , presence: true

  #relationship
  belongs_to :user
  has_many :comments
end
