class AdminMailer < ApplicationMailer
  def listing_bought_email(user, buyer, seller, listing)
    @buyer = buyer
    @seller = seller
    @listing = listing
    mail(to: user.email, subject: 'A Reservation on Vacancy Travel has been Sold.')
  end

  def listing_switch_email(user, listing)
    @buyer = listing.buyer
    @seller = listing.user
    @listing = listing
    mail(to: user.email, subject: 'Reservation switched')
  end

  def listing_posted_email(user, listing)
    @listing = listing
    @seller = listing.user

    mail(to: user.email, subject: 'Listing Posted on Vacancy Travel – Please Log In to Confirm')
  end

  def listing_confirmed_email(user, listing)
    @listing = listing

    mail(to: user.email, subject: 'A listing has been confirmed and posted on Vacancy Travel')
  end
end
