require "test_helper"

class SendTermsheetJobTest < ActiveJob::TestCase
  setup do
    @real_estate = real_estates(:complete_information) # Assuming you have a fixture for real estates
  end

  test "should enqueue job" do
    assert_enqueued_with(job: SendTermsheetJob, args: [@real_estate]) do
      SendTermsheetJob.perform_later(@real_estate)
    end
  end

  test "should send email" do
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      SendTermsheetJob.perform_now(@real_estate)
    end

    mail = ActionMailer::Base.deliveries.last
    assert_equal "Your Real Estate Profit and Return Calculator PDF is Ready", mail.subject
    assert_equal [@real_estate.email], mail.to
    assert_match /Real Estate Termsheet/, mail.body.encoded
  end
end
