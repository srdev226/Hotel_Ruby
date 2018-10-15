# module Hginapa
  class UsersController < ApplicationController
    include ApplicationHelper
    
    before_filter :authenticate_admin!, only: [:index, :new, :create, :edit, :update, :destroy]
    
    def index
      if current_admin.admin?
        puts @users
        @users = Admin.where(admin: false)
      else
        redirect_to :back
      end
    end
    
    def new
      @user = Admin.new
      @url = admin_user_create_path
      @hotels = Hotel.all
    end
    
    def create
      @user = Admin.new(user_params)
      puts "***************"
      puts @user.to_json
      puts "***************"
      respond_to do |format|
          if @user.save
            format.html  { redirect_to(users_path,
                          :notice => 'User was successfully created.') }
            format.json  { render :json => @user,
                          :status => :created, :location => @user }
          else
            format.html  { render :action => "new" }
            format.json  { render :json => @user.errors,
                          :status => :unprocessable_entity }
          end
        end
    end
    
    
    def edit
      @user = User.find(params[:id])
      @url = user_path(@user)
    end
    
    def update
      @user = User.find params[:id]
      respond_to do |format|
        if @user.update user_params
          format.html  { redirect_to(users_url,
                      :notice => 'User was successfully updated.') }
          format.json  { render :json => @user,
                      :status => :created, :location => @user }
        else
          format.html  { redirect_to :back }
          format.json  { render :json => @user.errors,
                      :status => :unprocessable_entity }
        end
      end
    end
    
    def destroy
      @user = User.find(params[:id])
      
      respond_to do |format|
       if @user.destroy
         format.html  { redirect_to(users_url,
                     :notice => 'User was successfully destroyed.') }
         format.json  { render :json => @user,
                     :status => :created, :location => @user }
       else
         format.html  { redirect_to :back }
         format.json  { render :json => @user.errors,
                     :status => :unprocessable_entity }
       end
     end
     end
    

    def show
      if current_admin && current_admin.admin
        @listings = Listing.where(hotel_id: current_admin.hotel_id).group_by(&:hotel_id)
        @listings_title = 'Here are all listings.'
      elsif current_admin
        @listings = Listing.where(hotel_id: current_admin.hotel_id).group_by(&:hotel_id)
        @listings_title = 'Here are all listings.'
      else
        @listings = current_user.listings.group_by(&:hotel_id)
        @listings_title = 'Here are your listings.'
      end
    end
    
    private
    
    def user_params
     params.require(:admin).permit(:email, :first_name, :last_name, :password, :phone_number, :hotel_id)
      #params.require(:user).permit(:email, :first_name, :last_name, :password, :phone_number, :type)
    end

  end
# end
