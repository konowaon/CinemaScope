class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :movie_tags, dependent: :destroy
  has_many :tags, through: :movie_tags

  validates :title, presence: true
end
