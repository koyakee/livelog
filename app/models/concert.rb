class Concert < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :artist, :status, :date, :venue, presence: true
  validates :image, content_type: ['image/png', 'image/jpeg']
end
