class Product < ApplicationRecord
  belongs_to :user
  has_many :product_quantities
  enum status: [:active, :inactive]
  validates :name, :status, :price, presence:true
end
