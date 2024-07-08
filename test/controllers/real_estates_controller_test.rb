require "test_helper"

class RealEstatesControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  setup do
    @real_estate = real_estates(:one)
  end

  test "should get index" do
    get real_estates_url
    assert_response :success
  end

  test "should get new" do
    get new_real_estate_url
    assert_response :success
  end

  test "should create real_estate" do
    assert_difference("RealEstate.count") do
      post real_estates_url, params: {
        real_estate: {
          address: "123 Maple Street",
          arv: 1000000,
          email: "test@example.com",
          first_name: "Alice",
          last_name: "Smith",
          loan_term: 12,
          phone_number: "5551234567",
          purchase_price: 600000,
          repair_budget: 150000
        },
        as: :turbo_stream
      }
    end

    assert_response :found  # :found corresponds to 302 status code
    assert_redirected_to loans_home_url
  end

  test "should check that the jobs was enqueued" do
    assert_enqueued_with(job: SendTermsheetJob) do
      post real_estates_url, params: {
        real_estate: {
          address: "123 Maple Street",
          arv: 1000000,
          email: "test@example.com",
          first_name: "Alice",
          last_name: "Smith",
          loan_term: 12,
          phone_number: "5551234567",
          purchase_price: 600000,
          repair_budget: 150000
        }, as: :turbo_stream
      }
    end
  end

  test "should show real_estate" do
    get real_estate_url(@real_estate)
    assert_response :success
  end

  test "should show real_estate with profit data and loan amount" do
    get real_estate_url(@real_estate)
    assert_response :success

    assert_select 'p strong', 'PROFIT:'
    assert_select 'p strong', 'LOAN AMOUNT:'
  end

  test "should get edit" do
    get edit_real_estate_url(@real_estate)
    assert_response :success

    # assert_select 'div label', 'Profit'
    # assert_select 'div label', 'Loan amount'
  end

  test "should update real_estate with profit and purchase_price different" do
    patch real_estate_url(@real_estate), params: { 
      real_estate: { 
        address: @real_estate.address, 
        arv: @real_estate.arv, 
        email: @real_estate.email, 
        first_name: @real_estate.first_name, 
        last_name: @real_estate.last_name, 
        loan_term: 6, 
        phone_number: @real_estate.phone_number, 
        purchase_price: 200000, 
        repair_budget: @real_estate.repair_budget 
      }
    }

    @real_estate.reload
    @real_estate.loan_amount = @real_estate.calculate_loan_amount
    @real_estate.profit = @real_estate.calculate_estimated_profit

    assert_in_delta 180000, @real_estate.loan_amount, 0.01
    assert_in_delta 37987.464, @real_estate.profit, 0.01
    assert_redirected_to real_estate_url(@real_estate)
  end

  test "should destroy real_estate" do
    assert_difference("RealEstate.count", -1) do
      delete real_estate_url(@real_estate)
    end

    assert_redirected_to real_estates_url
  end
end
