# Preview all emails at http://localhost:3000/rails/mailers/buyer_mailer
class BuyerMailerPreview < ActionMailer::Preview
  def confirmation_preview
    BuyerMailer.confirmation_email(Buyer.first, Listing.first)
  end
end
