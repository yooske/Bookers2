class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  
  has_one_attached :image
end
