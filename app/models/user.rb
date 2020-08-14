class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname, :email, :encrypted_passwaold, :passwaold_confirmation, :familyname_kanji, :firstname_kanji, :familyname_katakana, :firstname_katakana, :birthday


    VALID_NAME_KAJI_REGEX = /\A(?=.*?[ぁ-んァ-ン一-龥])\z/
    validates :familyname_kanji, format: { with: VALID_NAME_KAJI_REGEX }
    validates :firstname_kanji, format: { with: VALID_NAME_KAJI_REGEX }

    VALID_NAME_KATAKANA_REGEX = /\A(?=.*?[ァ-ン])\z/
    validates :familyname_katakana, format: { with: VALID_NAME_KATAKANA_REGEX }
    validates :firstname_katakana, format: { with: VALID_NAME_KATAKANA_REGEX }
  end
end
