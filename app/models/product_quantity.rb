class ProductQuantity < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :sale

  validates :product_id, :quantity, presence: true
end
