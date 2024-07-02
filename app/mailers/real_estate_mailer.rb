class RealEstateMailer < ApplicationMailer
  def send_termsheet
    @real_estate = params[:real_estate]
    attachments["termsheet_#{@real_estate.first_name.downcase}_#{@real_estate.last_name.downcase}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: "Termsheet - #{@real_estate.first_name + @real_estate.last_name}", template: 'real_estates/termsheet')
    )
    mail(to: @real_estate.email, subject: 'Your Real Estate Profit and Return Calculator PDF is Ready')
  end
end
