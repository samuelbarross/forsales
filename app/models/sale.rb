class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  belongs_to :discount, optional: true
  has_many :product_quantities, dependent: :destroy
  accepts_nested_attributes_for :product_quantities, allow_destroy: true, reject_if: :all_blank
  validates :sale_date, :product_quantities, presence:true
end
