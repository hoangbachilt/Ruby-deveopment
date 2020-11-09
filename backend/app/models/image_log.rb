class ImageLog < ApplicationRecord
  belongs_to :user
  belongs_to :image
  belongs_to :transaction
end
