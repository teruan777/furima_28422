class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname, :email, :password, :familyname_kanji, :firstname_kanji, :familyname_katakana, :firstname_katakana, :birthday

    VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/.freeze
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :email, format: { with: VALID_EMAIL_REGEX }

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :password, format: { with: VALID_PASSWORD_REGEX }

    VALID_NAME_KANJI_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
    validates :familyname_kanji, format: { with: VALID_NAME_KANJI_REGEX }
    validates :firstname_kanji, format: { with: VALID_NAME_KANJI_REGEX }

    VALID_NAME_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :familyname_katakana, format: { with: VALID_NAME_KATAKANA_REGEX }
    validates :firstname_katakana, format: { with: VALID_NAME_KATAKANA_REGEX }
  end
end
