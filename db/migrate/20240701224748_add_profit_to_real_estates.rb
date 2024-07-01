class AddProfitToRealEstates < ActiveRecord::Migration[7.0]
  def change
    add_column :real_estates, :profit, :decimal, precision: 15, scale: 3, null: true
  end
end
