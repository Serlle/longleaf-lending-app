class SendTermsheetJob < ApplicationJob
  queue_as :default

  def perform(real_estate)
    # Use RealEstateMailer of create action to background job and use send_termsheet method for create email
    RealEstateMailer.with(real_estate: real_estate).send_termsheet.deliver_now
  end
end
