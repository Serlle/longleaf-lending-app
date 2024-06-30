class RealEstate < ApplicationRecord
  validates :address, :loan_term, :purchase_price, :repair_budget, 
    :arv, :first_name, :last_name, :phone_number, 
  presence: true

  validates :purchase_price, :repair_budget, :arv, 
  numericality: { only_integer: true, greater_than_or_equal_to: 1000 }

  validates :first_name, :last_name, 
  length: { minimum: 2, message: "must have minimum 2 characters" }
  
  validates :loan_term, 
  presence: true, inclusion: { in: 1..12, message: "must be of 1 to 12 months" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
    uniqueness: { case_sensitive: false },
    length: { maximum: 105 },
    format: { with: VALID_EMAIL_REGEX }
end
