class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname, :email, :passwaold, :passwaold_confirmation, :familyname_kanji, :firstname_kanji, :familyname_katakana, :firstname_katakana, :birthday
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX }

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/
    validates :passworad, { minimum: 6 },
              format: { with: VALID_PASSWORD_REGEX  }
    validates :passworad, confirmation: true

    VALID_NAME_KAJI_REGEX = /\A(?=.*?[ぁ-んァ-ン一-龥])\z/
    validates :familyname_kanji, format: { with: VALID_NAME_KAJI_REGEX }
    validates :firstname_kanji, format: { with: VALID_NAME_KAJI_REGEX }

    VALID_NAME_KATAKANA_REGEX = /\A(?=.*?[ァ-ン])\z/
    validates :familyname_katakana, format: { with: VALID_NAME_KATAKANA_REGEX }
    validates :firstname_katakana, format: { with: VALID_NAME_KATAKANA_REGEX }
  end
end
