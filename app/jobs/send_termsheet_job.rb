class SendTermsheetJob < ApplicationJob
  queue_as :default

  def perform(real_estate)
    # Moved RealEstateMailer of create action to background job
    RealEstateMailer.with(real_estate: real_estate).send_termsheet.deliver_now
  end
end
