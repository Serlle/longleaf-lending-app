class CreateRealEstates < ActiveRecord::Migration[7.0]
  def change
    create_table :real_estates do |t|
      t.string :address
      t.integer :loan_term
      t.integer :purchase_price
      t.integer :repair_budget
      t.integer :arv
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
