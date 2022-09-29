class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  has_many :attendances, dependent: :destroy

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name,  presence: true, length: { maximum: 50 }
  #大文字小文字を区別しない(false)に設定する、通常のuniquenessはtrueと判断
  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  index({email: 1},{unique: true, name: "index_users_on_email"})

  has_secure_password

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
