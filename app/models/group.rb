class Group < ApplicationRecord
  has_one_attached :icon
  has_many :hours
end
