require 'rails_helper'

RSpec.describe Sale, type: :model do
  context 'calculation total sale value' do
    it 'sale to valid' do
      params = {
        sale: {
          client_id: Client.limit(Client.count).order("RANDOM()").first.id,
          user_id: User.first.id,
          sale_date: Faker::Date.between(from: 120.days.ago, to: Time.now),
          product_quantities_attributes: [
            { quantity: rand(1...20),
            user_id: User.first.id ,
            product_id: Product.limit(Product.count).order("RANDOM()").first.id }
          ]
        }
      }

      sale = Sale.new(params[:sale])
      expect(sale).to be_valid
    end

    it 'discount money' do
      params = {
        sale: {
          client_id: Client.limit(Client.count).order("RANDOM()").first.id,
          user_id: User.first.id,
          sale_date: Faker::Date.between(from: 120.days.ago, to: Time.now),
          discount_id: Discount.where(status: :active, kind: :money).first.id,
          product_quantities_attributes: [
            { quantity: rand(1...20),
            user_id: User.first.id ,
            product_id: Product.limit(Product.count).order("RANDOM()").first.id }
          ]
        }
      }

      sale = Sale.new(params[:sale])

      _tot = 0
      sale.product_quantities.each do |pq|
        _tot += pq.quantity * pq.product.price
      end

      if _tot > 0
        if sale.discount
          case sale.discount.kind
          when 'money'
            sale.total_price = _tot - sale.discount.value
          when 'porcent'
            sale.total_price = _tot - (_tot * sale.discount.value)
          end
        else
          sale.total_price = _tot
        end
      end

      expect(sale.discount.kind).to eq('money')
      expect(sale.total_price).to be < _tot.to_f
    end

    it 'discount porcent' do
      params = {
        sale: {
          client_id: Client.limit(Client.count).order("RANDOM()").first.id,
          user_id: User.first.id,
          sale_date: Faker::Date.between(from: 120.days.ago, to: Time.now),
          discount_id: Discount.where(status: :active, kind: :porcent).first.id,
          product_quantities_attributes: [
            { quantity: rand(1...20),
            user_id: User.first.id ,
            product_id: Product.limit(Product.count).order("RANDOM()").first.id }
          ]
        }
      }

      sale = Sale.new(params[:sale])

      _tot = 0
      sale.product_quantities.each do |pq|
        _tot += pq.quantity * pq.product.price
      end

      if _tot > 0
        if sale.discount
          case sale.discount.kind
          when 'money'
            sale.total_price = _tot - sale.discount.value
          when 'porcent'
            sale.total_price = _tot - (_tot * sale.discount.value)
          end
        else
          sale.total_price = _tot
        end
      end

      expect(sale.discount.kind).to eq('porcent')
      expect(sale.total_price).to be < _tot.to_f
    end
  end
end