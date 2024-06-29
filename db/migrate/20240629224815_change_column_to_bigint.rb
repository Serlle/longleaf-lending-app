class ChangeColumnToBigint < ActiveRecord::Migration[7.0]
  def change
    def change
      change_column :real_estates, :purchase_price, :bigint
      change_column :real_estates, :repair_budget, :bigint
      change_column :real_estates, :arv, :bigint
    end
  end
end
