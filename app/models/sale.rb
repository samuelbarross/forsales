class Sale < ApplicationRecord
  before_save :total_sale

  belongs_to :client
  belongs_to :user
  belongs_to :discount, optional: true

  has_many :product_quantities, dependent: :destroy

  accepts_nested_attributes_for :product_quantities, allow_destroy: true

  has_one_attached :main_image

  validates :sale_date, :product_quantities, presence:true

  attr_accessor :skip_callbacks

  def total_sale
    _tot = 0
    self.product_quantities.each do |pq|
      _tot += pq.quantity * pq.product.price
    end

    if _tot > 0
      if self.discount
        case self.discount.kind
        when :money
          self.total_price = _tot - self.discount.value
        when :porcent
          self.total_price = _tot - (_tot * self.discount.value)
        end
      else
        self.total_price = _tot
      end
    end
  end
end
