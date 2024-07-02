class AddLoanAmountToRealEstates < ActiveRecord::Migration[7.0]
  def change
    add_column :real_estates, :loan_amount, :decimal, precision: 15, scale: 3, null: true
  end
end
