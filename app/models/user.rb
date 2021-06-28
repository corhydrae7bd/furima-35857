class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message:"is invalid. Input full-width characters.", allow_blank: true}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message:"is invalid. Input full-width characters.", allow_blank: true}
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message:"is invalid. Input full-width katakana characters.", allow_blank: true}
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message:"is invalid. Input full-width katakana characters.", allow_blank: true}
    validates :birthday
  end
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: {with: PASSWORD_REGEX, message:"is invalid. Include both letters and numbers", allow_blank: true}

end
