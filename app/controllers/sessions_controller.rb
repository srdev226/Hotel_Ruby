class SessionsController < Devise::SessionsController
  
  def new
    super do |resource|
      if params[:booking]
        session[:previous_url] = listing_path(params[:booking])
      end
    end
  end
  
end