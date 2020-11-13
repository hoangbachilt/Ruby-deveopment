class ImageForm
  attr_accessor :user_id, :folder_id, :title, :extension, :size, :picture
  include ActiveModel::Model

  validates :title, presence: true, length: {maximum: 300}
  validates :picture, presence: true
  validate :image_size_validation
  validate :validation_content_type

  def save!
    raise BadRequest, errors.full_messages.first if invalid?

    image = Image.new upload_attr
    image.picture.attach(upload_attr[:picture])
    image.save
    true
  end

  private

  def upload_attr
    {
      user_id: user_id,
      folder_id: folder_id,
      title: title,
      extension: extension,
      size: size,
      picture: picture
    }
  end

  def image_size_validation
    errors.add :size, :too_size if picture.size > 1.megabytes
  end

  def validation_content_type
    errors.add :extension, :fail_type unless
      content_type.include? upload_attr[:extension]
  end

  def content_type
    %w(image/png image/jpg image/jpeg)
  end
end
