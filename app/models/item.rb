class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  has_many :keeps, dependent: :destroy
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :arrival_day

  with_options presence: true do
    validates :item, :image, :text, :category, :status, :delivery_burden, :shipping_origin, :arrival_day
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category_id, :status_id, :delivery_burden_id, :shipping_origin_id, :arrival_day_id, numericality: { other_than: 1, message: "は ” -- ” 以外を選択してください" }
  end
end
