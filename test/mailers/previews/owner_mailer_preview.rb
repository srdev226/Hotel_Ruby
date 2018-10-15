# Preview all emails at http://localhost:3000/rails/mailers/owner_mailer
class OwnerMailerPreview < ActionMailer::Preview
  def purchase_confirmation_preview
    OwnerMailer.purchase_confirmation_email(Buyer.first, Seller.first, Listing.first)
  end

  def listing_confirmation_preview
    OwnerMailer.listing_confirmation_email(Listing.first)
  end

  def admin_approved_preview
    OwnerMailer.admin_approved_email(Listing.first)
  end
end
