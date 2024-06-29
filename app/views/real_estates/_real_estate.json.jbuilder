json.extract! real_estate, :id, :address, :loan_term, :purchase_price, :repair_budget, :arv, :first_name, :last_name, :phone_number, :email, :created_at, :updated_at
json.url real_estate_url(real_estate, format: :json)
