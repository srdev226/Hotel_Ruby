require 'rails_helper'

RSpec.feature 'root listings page' do
  context 'showing the listings' do
    scenario 'A normal listing is displayed' do
      listing = create(:listing, :confirmed)

      visit root_path

      expect(page).to have_content(listing.check_in)
      expect(page).to have_content(listing.price)
    end

    scenario 'A listing which is expired is not shown' do
      listing = create(
        :listing,
        :confirmed,
        purchased: false,
        check_in: Time.zone.now - 2.days,
      )

      visit root_path

      expect(page).not_to have_content(listing.price)
      expect(page).not_to have_content(listing.check_in)
    end
  end
end
