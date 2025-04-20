class Concert < ApplicationRecord
  belongs_to :user
  validates :artist, :date, :venue, presence: true
end
