# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def reservation_email_preview
    AdminMailer.reservation_email(Admin.first, Buyer.first, Seller.first, Listing.first)
  end

  def listing_confirmation_preview
    AdminMailer.listing_confirmation_email(Admin.first, Listing.first)
  end
end
