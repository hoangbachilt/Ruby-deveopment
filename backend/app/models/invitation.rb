class Invitation < ApplicationRecord
  belongs_to :folder
  belongs_to :sender, class_name: User.name
  belongs_to :recipent, class_name: User.name

  scope :invitation_status, ->(status){where status: status}
end
