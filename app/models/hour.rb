class Hour < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  validates :name, presence: true
  validates :amount, presence: true, inclusion: { in: 0..200 }
end
