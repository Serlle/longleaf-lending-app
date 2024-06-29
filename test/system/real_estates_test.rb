require "application_system_test_case"

class RealEstatesTest < ApplicationSystemTestCase
  setup do
    @real_estate = real_estates(:one)
  end

  test "visiting the index" do
    visit real_estates_url
    assert_selector "h1", text: "Real estates"
  end

  test "should create real estate" do
    visit real_estates_url
    click_on "New real estate"

    fill_in "Address", with: @real_estate.address
    fill_in "Arv", with: @real_estate.arv
    fill_in "Email", with: @real_estate.email
    fill_in "First name", with: @real_estate.first_name
    fill_in "Last name", with: @real_estate.last_name
    fill_in "Loan term", with: @real_estate.loan_term
    fill_in "Phone number", with: @real_estate.phone_number
    fill_in "Purchase price", with: @real_estate.purchase_price
    fill_in "Repair budget", with: @real_estate.repair_budget
    click_on "Create Real estate"

    assert_text "Real estate was successfully created"
    click_on "Back"
  end

  test "should update Real estate" do
    visit real_estate_url(@real_estate)
    click_on "Edit this real estate", match: :first

    fill_in "Address", with: @real_estate.address
    fill_in "Arv", with: @real_estate.arv
    fill_in "Email", with: @real_estate.email
    fill_in "First name", with: @real_estate.first_name
    fill_in "Last name", with: @real_estate.last_name
    fill_in "Loan term", with: @real_estate.loan_term
    fill_in "Phone number", with: @real_estate.phone_number
    fill_in "Purchase price", with: @real_estate.purchase_price
    fill_in "Repair budget", with: @real_estate.repair_budget
    click_on "Update Real estate"

    assert_text "Real estate was successfully updated"
    click_on "Back"
  end

  test "should destroy Real estate" do
    visit real_estate_url(@real_estate)
    click_on "Destroy this real estate", match: :first

    assert_text "Real estate was successfully destroyed"
  end
end
