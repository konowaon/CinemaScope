class Comment < ApplicationRecord
  # belongs_to :review
  belongs_to :user
  belongs_to :movie
  
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }
end
