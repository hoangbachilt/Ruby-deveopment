class RegistrationsForm
  include ActiveModel::Model
  attr_accessor :name, :email, :password
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},uniqueness: { case_sensitive: true, model: User}
  validates :password, presence: true, length: { minimum: 8 }

  def save!
    raise BadRequest, errors.full_messages if invalid?
    @user = User.new(attr_user)
    @user.save
    
    true
  end

  private

  def attr_user
    {
      name: name,
      email: email,
      password: password,
    }
  end
end
