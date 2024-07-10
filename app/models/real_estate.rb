class RealEstate < ApplicationRecord
  # Validate that the data is present
  validates :address, :loan_term, :purchase_price, :repair_budget, 
  :arv, :first_name, :last_name, :phone_number, 
  presence: true

  # Validate that the data is number, it is integer and grater than or equal to 1000
  validates :purchase_price, :repair_budget, :arv, 
  numericality: { only_integer: true, greater_than_or_equal_to: 1000 }

  # Validate that the data is more of 2 characteres
  validates :first_name, :last_name, 
  length: { minimum: 2, message: "must have minimum 2 characters" }
  
  # Validate that the data have to more or equal 1 and less or equal 12
  validates :loan_term, 
  presence: true, inclusion: { in: 1..12, message: "must be of 1 to 12 months" }

  # Validate that the data is with format email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  uniqueness: { case_sensitive: false },
  length: { maximum: 105 },
  format: { with: VALID_EMAIL_REGEX }

  # Method to calculation profit with parameters
  def calculate_estimated_profit
    if purchase_price.present? and arv.present?
      max_loan_by_purchase_price = 0.9 * purchase_price
      max_loan_by_arv = 0.7 * arv
      loan_amount = [max_loan_by_purchase_price, max_loan_by_arv].min
  
      monthly_interest_rate = 0.13 / 12
      total_interest_expense = loan_amount * ((1 + monthly_interest_rate)**loan_term - 1)
  
      #we return profit result
      arv - loan_amount - total_interest_expense
    end
  end

  # Method to calculation loan amount with parameters
  def calculate_loan_amount
    #we return loan amount result
    0.9 * purchase_price if purchase_price.present? 
  end
end
