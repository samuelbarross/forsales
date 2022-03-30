class AddTotalPriceToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :total_price, :decimal
  end
end
