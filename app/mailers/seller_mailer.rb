class SellerMailer < ApplicationMailer

  # sent after seller signs up

  def listing_posted_email(user, listing)
    @user = user
    @listing = listing
  

    mail(to: [user.email, listing.seller_contact_email], subject: 'Your Listing on Vacancy Travel has been Received')
  end

  def listing_bought_email(user, listing)
    @user = user
    @listing = listing

    mail(to: [user.email, listing.seller_contact_email], subject: 'Congratulations.  Your Reservation on Vacancy Travel has been Sold!')
  end

  def listing_confirmed_email(listing)
    @listing = listing

    mail(to: [listing.user.email, listing.seller_contact_email], subject: 'Your Listing on Vacancy Travel has been Confirmed')
  end
end


