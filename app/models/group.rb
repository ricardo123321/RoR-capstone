class Group < ApplicationRecord
  validates :content, :length => { :maximum => 30 }
end
