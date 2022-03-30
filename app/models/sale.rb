class Sale < ApplicationRecord
  before_save :total_sale

  belongs_to :client
  belongs_to :user
  belongs_to :discount, optional: true

  has_many :product_quantities, dependent: :destroy

  accepts_nested_attributes_for :product_quantities, allow_destroy: true

  has_one_attached :main_image

  validates :sale_date, :product_quantities, presence:true

  def total_sale
    _tot = 0
    self.product_quantities.each do |pq|
      _tot += pq.quantity * pq.product.price
    end

    self.total_price = (self.discount ? (_tot - self.discount) : _tot) if _tot > 0
  end
end
