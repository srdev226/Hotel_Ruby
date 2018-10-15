# Preview all emails at http://localhost:3000/rails/mailers/seller_mailer
class SellerMailerPreview < ActionMailer::Preview
	def seller_signup_preview
    SellerMailer.signup_email(User.first)
  end

  def sold_preview
    SellerMailer.listing_bought_email(Seller.first, Listing.first)
  end

  def approved_preview
    SellerMailer.listing_posted_email(Seller.first, Listing.first)
  end

  def admin_approved_preview
    SellerMailer.listing_confirmed_email(Listing.first)
  end
end
