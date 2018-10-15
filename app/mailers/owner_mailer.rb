class OwnerMailer < ApplicationMailer
  def listing_bought_email(buyer, seller, listing)
    @buyer = buyer
    @seller = seller
    @listing = listing
    mail(to: [ENV['RYAN_EMAIL'], ENV['SCOTT_EMAIL']], subject: 'A Reservation on Vacancy Travel has been Sold.')
  end

  def listing_posted_email(listing)
    @listing = listing
    @seller = listing.user

    mail(to: [ENV['RYAN_EMAIL'], ENV['SCOTT_EMAIL']], subject: 'Listing Posted on Vacancy Travel – Please Log In to Confirm')
  end

  def listing_confirmed_email(listing)
    @listing = listing

    mail(to: [ENV['RYAN_EMAIL'], ENV['SCOTT_EMAIL']], subject: 'A listing has been confirmed and posted on Vacancy Travel')
  end

  def listing_switch_email(listing)
    @listing = listing

    mail(to: [ENV['RYAN_EMAIL'], ENV['SCOTT_EMAIL']], subject: 'Vacancy Travel Reservation at the Hilton Garden Inn Napa')
  end
end
