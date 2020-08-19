class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :house_add
end
