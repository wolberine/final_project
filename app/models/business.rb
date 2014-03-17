class Business < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :address, presence: true	
  has_secure_password
  validates :password, length: { minimum: 6 }
  geocoded_by :address
  after_validation :geocode

  def Business.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    MenuItem.where("business_id = ?", id)
  end

  def Business.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Business.hash(Business.new_remember_token)
    end

end
