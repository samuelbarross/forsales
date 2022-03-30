class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  belongs_to :discount, optional: true
  has_many :product_quantities
end
