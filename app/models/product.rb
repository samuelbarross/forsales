class Product < ApplicationRecord
  belongs_to :user
  enum status: [:active, :inactive]
  validates :name, :status, :price, presence:true
end
