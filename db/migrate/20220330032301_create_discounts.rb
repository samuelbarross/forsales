class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.text :description
      t.integer :value
      t.integer :kind
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
