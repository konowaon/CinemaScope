class MovieTag < ApplicationRecord
  belongs_to :movie
  belongs_to :tag

  validates :movie_id, presence: true
  validates :tag_id, presence: true
end
