class Comment < ApplicationRecord
  acts_as_paranoid

  #validates
  validates :content ,presence: true


  #relationship
  belongs_to :food
  belongs_to :user
end
