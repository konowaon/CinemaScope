class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :comments, dependent: :destroy
  
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true
end
