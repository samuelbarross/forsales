class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.references :client, null: false, foreign_key: true
      t.date :sale_date
      t.references :user, null: false, foreign_key: true
      t.references :discount, null: true, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
