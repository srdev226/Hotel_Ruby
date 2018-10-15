class BuyerMailer < ApplicationMailer

# when buyer signs up, before purchase

  def buyer_signup(user)
     @user = user

     mail(to: [user.email, 'ryan.mindigo@gmail.com', 'scottie.curran@gmail.com'], subject: 'Thanks for creating an account on Vacancy Travel!')

  end


# when buyer finalizes purchase

  def listing_bought_email(user, listing)
    @user = user
    @listing = listing

    mail(to: user.email, subject: 'Vacancy Travel Reservation Purchase')
  end

  def listing_switch_email(user, listing)
    @user = user
    @listing = listing

    mail(to: user.email, subject: 'Vacancy Travel Reservation at the Hilton Garden Inn Napa')
  end
end

