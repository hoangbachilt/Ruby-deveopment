class Image < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_one_attached :picture
end
