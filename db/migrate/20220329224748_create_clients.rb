class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.date :birth_date
      t.string :phone
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.string :country
      t.string :city
      t.string :state
      t.string :neighborhood
      t.string :street
      t.string :number

      t.timestamps
    end
  end
end
