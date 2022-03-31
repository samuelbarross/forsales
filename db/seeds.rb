### Users
User.create name: 'Usuário Teste', status: :active, kind: :salesman, email: 'teste@email.com', password: '12345678', password_confirmation: '12345678'

### Products
100.times { Product.create name:  Faker::Commerce.product_name, status: :active, price: Faker::Commerce.price, user: User.first }

Faker::Config.locale = 'pt-BR'

### Clients
100.times do
  name = Faker::Name.name
  Client.create(name: name,
    email: Faker::Internet.email(name: name, domain: 'example.com'),
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone: Faker::PhoneNumber.cell_phone,
    user: User.first,
    country: 'Brasil',
    city: Faker::Address.city,
    state: Faker::Address.state,
    street: Faker::Address.street_name,
    number: Faker::Address.building_number,
    status: :active
  )
end

### Discount
d = Discount.new
d.name = 'Desconto melhor comprador'
d.description = 'melhor comprador do mês'
d.value = 10
d.kind = :porcent
d.status = :active
d.user = User.first
d.save(validate: false)

### Sales
100.times do
  sale = Sale.new
  sale.client_id = Client.limit(Client.count).order("RANDOM()").first.id
  sale.user = User.first
  sale.sale_date = Faker::Date.between(from: 120.days.ago, to: Time.now)
  sale.save(validate: false)
end

### Product Quantity
Sale.all.each do |s|
  for a in 1..rand(1...10) do
    ProductQuantity.create(product_id: Product.limit(Product.count).order("RANDOM()").first.id,
      user: User.first,
      quantity: rand(1...20),
      sale_id: s.id
    )
  end

  _tot = 0
  s.product_quantities.each do |pq|
    _tot += pq.quantity * pq.product.price
  end
  s.skip_callbacks = true
  s.save
end




