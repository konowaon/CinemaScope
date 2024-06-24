class Movie < ApplicationRecord
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :image
  validate :image_presence
  validates :title, :description, :release_date, :genre_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :release_date, presence: true
  # validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :category, presence: true, inclusion: { in: %w[new popular], message: "%{value} is not a valid category" }
  private

  def image_presence
    errors.add(:image, 'を添付してください') unless image.attached?
  end
end
