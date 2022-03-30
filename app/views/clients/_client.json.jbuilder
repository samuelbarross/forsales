json.extract! client, :id, :name, :email, :birth_date, :phone, :user_id, :status, :country, :city, :state, :neighborhood, :street, :number, :created_at, :updated_at
json.url client_url(client, format: :json)
