class Item < ApplicationRecord
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :arrival_day

  validates :item, :image, :text, :category, :status, :delivery_burden, :shipping_origin, :arrival_day, :price, presence: true
  validates :item, length: { maximum: 40 }
  
  validates :text, length: { maximum: 1000 }

  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 }

  validates :category_id, :status_id, :delivery_burden_id, :shipping_origin_id, :arrival_day_id, numericality: { other_than: 1 }

end
