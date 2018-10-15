# module Hginapa
  class ListingsController < ApplicationController

    before_action :find_listing, only: [:show, :edit, :update, :complete, :switch, :pay, :approved]
    before_action :authenticate_admin!, only: [:admin]
    before_action :getData, only: [:new, :edit]

    def index
      # @listings = Listing.
      #   unpurchased.
      #   confirmed.
      #   current.
      #   order('check_in DESC').
      #   page(params[:page])

      @hotels = Hotel.order(fullname: :ASC).all
      # listings = Listing.all.group_by(&:hotel_id)
      if user_signed_in? 
        @my_listing = current_user.listings.map(&:id)
      end

      if params.has_key?(:hotel)
        @hotel_shortname = params[:hotel];
        @hotel = Hotel.find_by(shortname: @hotel_shortname)
        @listings = @hotel.listings.unpurchased.confirmed.current.order(price: :ASC).page(params[:page])
        # @listings = Listing.order(hotel_id: :DESC).all
        # puts "**************"
        # puts @listings.to_json
        # puts @listings.count
        # puts "@@@@@@@@@"
        # puts Listing.order(hotel_id: :DESC).all.to_json
        # puts "**************"
      else
        @listings = Listing.unpurchased.confirmed.current.order(price: :ASC).limit(10)
      end
    end

    def show
      @amount = @listing.total_cost
      if user_signed_in? 
        @my_listing = current_user.listings.map(&:id)
      end
    end

    # when admin confirms a listing is legitimate

    def complete
      if user_signed_in? 
        user = current_user
      elsif admin_signed_in?
        user = current_admin
      end
      @listing.update_attribute(:confirmed_at, Time.now)
      @listing.update_attribute(:confirmed_by, user.email)

      SellerMailer.listing_confirmed_email(@listing).deliver_later
      Admin.find_each do |admin|
        AdminMailer.listing_confirmed_email(admin, @listing).deliver_later
      end
      OwnerMailer.listing_confirmed_email(@listing).deliver_later
      redirect_to admin_path, notice: "Reservation confirmed"
    end

    # when admin switches a listing to buyer's name on their own internal systems

    def switch
      @listing.update_attribute(:switched_at, Time.now)

      BuyerMailer.listing_switch_email(@listing.buyer, @listing).deliver_later
      OwnerMailer.listing_switch_email(@listing).deliver_later
      redirect_to admin_path, notice: "Reservation Switched"
    end

    # when seller clicks confirmation button on show page

    def approved
      @listing.update_attribute(:seller_approved_at, Time.now)

      SellerMailer.listing_posted_email(current_user, @listing).deliver_later
      Admin.find_each do |admin|
        AdminMailer.listing_posted_email(admin, @listing).deliver_later
      end
      OwnerMailer.listing_posted_email(@listing).deliver_later

      redirect_to user_path(current_user), notice: "Reservation Confirmed!"
    end

    def bought
    end

    def new
      if user_signed_in? 
        @listing = current_user.listings.build
      elsif admin_signed_in?
        @listing = current_admin.listings.build
      else
        @listing = Listing.new
      end
      @room_types = RoomType.where(hotel_id: Hotel.first.id)
    end

    def create
      if user_signed_in? 
        @listing = current_user.listings.build(listing_params_create)
      elsif admin_signed_in?
        @listing = current_admin.listings.build(listing_params_create)
      end
      
      if @listing.save
        redirect_to listing_path(@listing)
      else
        render "new"
      end

    end

    def edit
      @room_types = RoomType.where(hotel_id: @listing.hotel_id)
    end

    def update
      if @listing.update(listing_params_update)
      flash[:success] = "Listing updated"
      redirect_to listing_path(@listing)
      else
        render 'edit'
      end
    end

    def destroy
      Listing.find(params[:id]).destroy
      flash[:success] = "Listing Deleted"
      redirect_to admin_path
    end

    def admin
      @listings = Listing.where(hotel_id: current_admin.hotel_id).grouped_by_status
    end

    def buy
      @listings = Listing.all.order('check_in DESC')
    end



    def user_listings
    end

  # when buyer purchases listing, she show page for window.url call inside PayPal modal function

    def confirmation
      @listing = Listing.find params[:id]
      @seller = @listing.user

      unless @listing.purchased?
        @listing.update_attributes buyer_id: current_user.id, purchased: true

        BuyerMailer.listing_bought_email(current_user, @listing).deliver_later
        SellerMailer.listing_bought_email(@seller, @listing).deliver_later
        Admin.find_each do |admin|
          AdminMailer.listing_bought_email(admin, current_user, @seller, @listing).deliver_later
        end
        OwnerMailer.listing_bought_email(current_user, @seller, @listing).deliver_later
      end
    end

  # change RoomTypes based on hotel
    def changeRoomTypes
      hotel_id = params[:hotel_id]
      @room_types = RoomType.where(hotel_id: hotel_id)
      respond_to do |format|
        # format.json { render json: @room_types}
        format.js
      end
    end
  # get hotels and booking_engines
    def getData
      @hotels = Hotel.all
      @booking_engines = BookingEngine.all
    end
  # contact page
    def contact

    end

  # search page
    def search
      redirect_to "/#{params[:hotel_name]}"
    end

    private


    def listing_params_create
      if user_signed_in?
        user = current_user
      elsif admin_signed_in?
        user = current_admin
      end
      params.require(:listing).permit(:hotel_id, :booking_engine_id, :check_in, :check_out, :room_type_id, :price, :paid_status, :confirmation_number, :name_on_reservation, :paypal_email, :seller_phone, :seller_contact_email).merge(user_id: user.id)
    end

    def listing_params_update
      params.require(:listing).permit(:bookingengine_id, :check_in, :check_out, :room_type_id, :price)
    end

    def find_listing
      @listing = Listing.find(params[:id])
    end
    
    


  end
# end
