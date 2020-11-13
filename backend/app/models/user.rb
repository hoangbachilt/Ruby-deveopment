class User < ApplicationRecord
  has_secure_password
  has_many :transactions
  has_many :folder_logs
  has_many :folders
  has_many :invitations
  has_many :images
end
