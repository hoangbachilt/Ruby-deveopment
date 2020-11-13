class FoldersForm
  include ActiveModel::Model
  attr_accessor :user_id, :status, :name
  validates :name, presence: true, uniqueness:
            {case_sensitive: true, model: Folder}

  def save!
    raise BadRequest, JSON(errors.full_messages) if invalid?

    @folder = Folder.new attr_folder
    @folder.save

    true
  end

  private

  def attr_folder
    {
      name: name,
      user_id: user_id,
      status: status
    }
  end
end
