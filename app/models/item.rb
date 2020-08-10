class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :delivery_burden, :shipping_origin, :arrival_day,

  validates :item, :image, :text, :category, :status, :delivery_burden, :shipping_origin, :arrival_day, :price, presence: true

  validates :category_id, :status_id, :delivery_burden_id, :shipping_origin_id, :arrival_day_id, numericality: { other_than: 1 }
  
end