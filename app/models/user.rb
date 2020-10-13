class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :keeps
  has_many :purchases
  has_many :comments

  with_options presence: true do
    validates :nickname, :email, :password, :familyname_kanji, :firstname_kanji, :familyname_katakana, :firstname_katakana, :birthday

    with_options format: { with: /\A\S+@\S+\.\S+\z/.freeze } do
      validates :email
    end

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/.freeze } do
      validates :password
    end

    with_options format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze } do
      validates :familyname_kanji
      validates :firstname_kanji
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/.freeze } do
      validates :familyname_katakana
      validates :firstname_katakana
    end
  end
end
