class Group < ApplicationRecord
  has_one_attached :icon
  has_many :hours
  validates :name, presence: true
  validates :icon, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..3.megabytes }
end
