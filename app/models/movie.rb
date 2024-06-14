class Movie < ApplicationRecord
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :movie_tags, dependent: :destroy
  has_many :tags, through: :movie_tags

  validates :title, presence: true
  validates :description, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
