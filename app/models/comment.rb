class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :txit presence: true
end
