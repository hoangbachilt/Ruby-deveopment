class FolderLog < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  belongs_to :transaction
end
