require "test_helper"

class RealEstateMailerTest < ActionMailer::TestCase
  test "send_termsheet" do
    # Create a RealEstate instance
    real_estate = real_estates(:complete_information)

    # Send the email
    email = RealEstateMailer.with(real_estate: real_estate).send_termsheet

    # Ensure the email is queued
    assert_emails 1 do
      email.deliver_now
    end

    # Verify the email content
    assert_equal ['john@example.com'], email.to
    assert_equal 'Your Real Estate Profit and Return Calculator PDF is Ready', email.subject
    assert_includes email.body.encoded, 'Dear John Connor'
  end
end
