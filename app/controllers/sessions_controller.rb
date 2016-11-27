class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])

      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
        #redirect_back_or_default()
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end

    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def create_facebook
    auth_hash = request.env['omniauth.auth']
    
    @authorization = Authorization.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
    if @authorization
      user = @authorization.user
      log_in user
      redirect_back_or user
    else
      uid = auth_hash['uid']
      provider = auth_hash['provider']
      email = auth_hash['info']['email']
      fname = auth_hash['info']['first_name']
      lname = auth_hash['info']['last_name']

      user = User.new fname: fname, lname: lname, email: email, password: uid
      user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      if user.save
        log_in user
        redirect_back_or user
      else
        message  = "Our app only support facebook account sign up with an Email address."
        flash[:warning] = message
        redirect_to root_url
      end
    end
  end

  def failure
    message  = "You need to allow access to our app."
    flash[:warning] = message
    redirect_to root_url
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def store_return_to
    session[:return_to] = request.url
  end
end
