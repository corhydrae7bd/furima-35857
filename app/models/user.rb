class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message:"is invalid. Input full-width characters.", allow_blank: true} do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message:"is invalid. Input full-width katakana characters.", allow_blank: true} do
      validates :last_name_reading
      validates :first_name_reading
    end
  end
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: {with: PASSWORD_REGEX, message:"is invalid. Include both letters and numbers", allow_blank: true}

end
