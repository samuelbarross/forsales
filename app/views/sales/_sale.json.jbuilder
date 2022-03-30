json.extract! sale, :id, :client_id, :sale_date, :user_id, :discount_id, :notes, :created_at, :updated_at
json.url sale_url(sale, format: :json)
