class Folder < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :invitations, dependent: :destroy
end
