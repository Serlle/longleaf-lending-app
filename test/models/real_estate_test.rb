require "test_helper"

class RealEstateTest < ActiveSupport::TestCase
  # Method to create variable for all the tests
  def setup
    @real_estate = RealEstate.new(
      address: "123 Maple Street",
      loan_term: 6,
      first_name: "John",
      last_name: "Doe",
      phone_number: "5551234567",
      email: "john.doe@example.com"
    )
  end

  test "real estate attributes must not be empty" do
    real_estate = RealEstate.new

    assert real_estate.invalid?
    assert real_estate.errors[:address].any?
    assert real_estate.errors[:loan_term].any?
    assert real_estate.errors[:purchase_price].any?
    assert real_estate.errors[:repair_budget].any?
    assert real_estate.errors[:arv].any?
    assert real_estate.errors[:first_name].any?
    assert real_estate.errors[:last_name].any?
    assert real_estate.errors[:phone_number].any?
    assert real_estate.errors[:email].any?
  end

  # Here we use the set up 
  test "real estate numerical attributes must be positive" do
    # Test with negative purchase_price
    @real_estate.purchase_price = -1
    assert @real_estate.invalid?
    assert_equal ["must be greater than or equal to 1000"],
      @real_estate.errors[:purchase_price]

    # Test with zero purchase_price
    @real_estate.purchase_price = 0
    assert @real_estate.invalid?
    assert_equal ["must be greater than or equal to 1000"],
      @real_estate.errors[:purchase_price]

    # Repeat for repair_budget
    @real_estate.repair_budget = -1
    assert @real_estate.invalid?
    assert_equal ["must be greater than or equal to 1000"],
      @real_estate.errors[:repair_budget]

    @real_estate.repair_budget = 0
    assert @real_estate.invalid?
    assert_equal ["must be greater than or equal to 1000"],
    @real_estate.errors[:repair_budget]

    # Repeat for arv
    @real_estate.arv = -1
    assert @real_estate.invalid?
    assert_equal ["must be greater than or equal to 1000"],
      @real_estate.errors[:arv]

    @real_estate.arv = 0
    assert @real_estate.invalid?
    assert_equal ["must be greater than or equal to 1000"],
      @real_estate.errors[:arv]

    # Test with positive repair_budget
    # Test with positive purchase_price
    # Test with positive arv
    @real_estate.repair_budget = 1000
    @real_estate.purchase_price = 1000
    @real_estate.arv = 1000
    assert @real_estate.valid?
    assert @real_estate.valid?
    assert @real_estate.valid?
  end

  test "should profit calculation of real estate" do
    real_estate = real_estates(:one)
    profit = real_estate.calculate_estimated_profit

    assert_in_delta 47577.077, profit, 0.01
  end

  test "should loan amount calculation of real estate" do
    real_estate = real_estates(:one) #Whit 100,000 on Purchase price - you can see the data in test/fixtures/real_estates.yml
    loan_amount = real_estate.calculate_loan_amount

    assert_in_delta 90000, loan_amount, 0.01
  end
end
