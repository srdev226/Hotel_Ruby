require 'rails_helper'

RSpec.describe Listing do
  context 'validations' do
    it do
      is_expected.to belong_to(:buyer).
        class_name('User').
        with_foreign_key(:buyer_id)
    end

    it { is_expected.to belong_to(:user) }

    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:user) }
  end

  context '.grouped_by_status' do
    it 'groups the listings by status' do
      create_list(:listing, 2)
      create_list(:listing, 2, :confirmed)
      create_list(:listing, 2, :switched)

      Listing.grouped_by_status

      expect(Listing.grouped_by_status.keys).to include(:confirmed)
    end
  end

  context '.status_list' do
    it 'lists all the status' do
      list = Listing.status_list

      expect(list).to eq(
        %w[pending_confirmation confirmed switched sold expired]
      )
    end
  end

  context '.confirmed' do
    it 'shows all confirmed listings' do
      confirmed_listing = create(:listing, confirmed_at: Time.zone.yesterday)
      unconfirmed_listing = create(:listing, confirmed_at: nil)

      listings = Listing.confirmed

      expect(listings).to include(confirmed_listing)
      expect(listings).not_to include(unconfirmed_listing)
    end
  end

  context '.current' do
    it 'shows all unexpired listings' do
      current_listing = create(:listing, check_in: Time.zone.today)
      expired_listing = create(:listing, check_in: Time.zone.yesterday)

      listings = Listing.current

      expect(listings).to include(current_listing)
      expect(listings).not_to include(expired_listing)
    end
  end

  context '.unpurchased' do
    it 'shows all unpurchased listings' do
      purchased_listing = create(:listing, purchased: true)
      unpurchased_listing = create(:listing, purchased: false)

      listings = Listing.unpurchased

      expect(listings).to include(unpurchased_listing)
      expect(listings).not_to include(purchased_listing)
    end
  end

  context '#expired?' do
    (0..23).each do |hour|
      travel_to(Time.zone.now.change(hour: hour)) do
        it 'is not expired if the check in date is today' do
          listing = create(:listing, check_in: Time.zone.today)

          expect(listing).not_to be_expired
        end

        it 'is expired if the check in date is past and not switched' do
          listing = create(:listing, check_in: Time.zone.yesterday)

          expect(listing).to be_expired
        end
      end
    end
  end

  context '#length_in_nights' do
    it 'returns the number of nights the reservation lasts for' do
      number_of_nights = 5
      listing = create(
        :listing,
        check_in: Time.zone.today,
        check_out: Time.zone.today + number_of_nights.day,
      )

      expect(listing.length_in_nights).to eq number_of_nights
      expect(listing.length_in_nights).to be_an Integer
    end
  end

  context '#status' do
    it 'is expired if unswitched and check in is before today' do
      listing = create(
        :listing,
        switched_at: nil,
        check_in: Time.zone.today - 2.days,
      )

      expect(listing.status).to eq(:expired)
    end

    it 'is NOT expired if unswitched and check in is today' do
      listing = create(
        :listing,
        switched_at: nil,
        check_in: Time.zone.today,
      )

      expect(listing.status).not_to eq(:expired)
    end

    it 'is marked as sold if confirmed and switched' do
      listing = create(
        :listing,
        switched_at: Time.zone.now,
        check_in: Time.zone.today,
        confirmed_at: Time.zone.now,
      )

      expect(listing.status).to eq(:sold)
    end

    it 'is switched if check in today, has a buyer, confirmed, but not switched' do
      buyer = create(:buyer)
      listing = create(
        :listing,
        check_in: Time.zone.today,
        confirmed_at: Time.zone.now,
        switched_at: nil,
        buyer: buyer,
      )

      expect(listing.status).to eq(:switched)
    end

    it 'is switched if check in today, has no buyer, confirmed, but not switched' do
      listing = create(
        :listing,
        check_in: Time.zone.today,
        confirmed_at: Time.zone.now,
        switched_at: nil,
        buyer: nil,
      )

      expect(listing.status).to eq(:confirmed)
    end

    it 'is pending confirmation otherwise' do
      listing = create(:listing, check_in: Time.zone.today, confirmed_at: nil)

      expect(listing.status).to eq(:pending_confirmation)
    end
  end

  context '#total_cost' do
    it 'returns the rate multiplied by the number of nights' do
      price = 207
      listing = create(
        :listing,
        check_in: Time.zone.yesterday,
        check_out: Time.zone.tomorrow,
        price: price,
      )

      expect(listing.total_cost).to eq price * 2
    end
  end
end
