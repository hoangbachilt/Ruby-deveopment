class User < ApplicationRecord
  has_secure_password
  has_many :transactions
  has_many :folder_logs
  has_many :folders
  has_many :blacklists, dependent: :destroy
  has_many :invitation_as_sender, foreign_key: :sender_id,
                              class_name: Invitation.name,
                              dependent: :destroy
  has_many :invitation_as_recipent, foreign_key: :recipent_id,
                                    class_name: Invitation.name,
                                    dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :images, dependent: :destroy
end
