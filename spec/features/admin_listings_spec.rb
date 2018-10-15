require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers

RSpec.feature 'admin dashboard' do
  context 'showing the listings' do
    scenario 'A normal listing is displayed' do
      admin = create(:admin)
      listing = create(:listing)
      listing_user = listing.user

      visit hginapa_admin_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_on 'Log in'

      expect(page).to have_content('Confirm and Switch Listing Checklist')
      expect(page).to have_content(listing_user.email)
      expect(page).to have_content(listing.price)
    end

    (0..23).each do |hour|
      scenario 'A normal listing is displayed until it is expired' do
        travel_to(Time.zone.now.change(hour: hour)) do
          admin = create(:admin)
          listing = create(:listing, check_in: Time.zone.today)
          expect(listing.status).not_to eq(:expired)

          visit hginapa_admin_path
          fill_in 'Email', with: admin.email
          fill_in 'Password', with: admin.password
          click_on 'Log in'

          expect(page).to have_content(listing.price)
          expect(page).to have_content(listing.confirmed_by)
        end
      end
    end

    scenario 'A switched listing is displayed' do
      admin = create(:admin)
      listing = create(:listing, :switched, confirmation_number: 'Switched')
      listing_user = listing.user

      visit hginapa_admin_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_on 'Log in'

      expect(page).to have_content(listing_user.email)
      expect(page).to have_content(listing.confirmation_number)
    end

    scenario 'A confirmed listing is displayed' do
      admin = create(:admin)
      listing = create(:listing, :confirmed, confirmation_number: 'Confirmed')
      listing_user = listing.user

      visit hginapa_admin_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_on 'Log in'

      expect(page).to have_content(listing_user.email)
      expect(page).to have_content(listing.confirmation_number)
    end
  end

  context 'deleting listings' do
    scenario 'the listing is removed after it is deleted' do
      admin = create(:admin)
      listing = create(:listing)
      listing_user = listing.user

      visit hginapa_admin_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_on 'Log in'

      expect(page).to have_content(listing_user.email)

      click_on 'Delete Listing'

      expect(page).not_to have_content(listing_user.email)
      expect(page).to have_content('Confirm and Switch Listing Checklist')
    end
  end
end
