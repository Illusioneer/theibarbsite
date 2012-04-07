class SessionsController < ApplicationController

  def new
    #redirect_to '/auth/twitter'
  end

  def create
    auth_hash = request.env['omniauth.auth']
    #logger.info "YOUR SESSION ID: #{session || 'BLANK'} and AUTH HASH IS: #{auth_hash}"
    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      User.where(user_id: session[:user_id]).first.add_provider(auth_hash)

      #render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
      # Log him in or sign him up

      if User.where("authorizations.uid" => auth_hash["uid"], "authorizations.provider" => auth_hash["provider"]).blank?
         auth = User.create :name => auth_hash["extra"]["raw_info"]["name"], :email => auth_hash["extra"]["raw_info"]["email"], :user_id => session["session_id"]
         auth.authorizations.create :user_id => session["session_id"], :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      else 
	       auth = User.where("authorizations.uid" => auth_hash["uid"], "authorizations.provider" => auth_hash["provider"]).first 
      end  
      # Create the session
      session[:user_id] = auth.user_id

      redirect_to root_url, :notice => "Welcome #{auth.name}!"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
