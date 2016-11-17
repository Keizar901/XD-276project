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

    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    if @authorization
      render text: "Welcome back #{@authorization.user.fname}! You have already signed up."
    else
      user = User.new fname: auth_hash["extra"]["raw_info"]["first_name"], lname: auth_hash["extra"]["raw_info"]["last_name"], email: auth_hash["info"]["email"]
      user.authorizations.build provider: auth_hash["provider"], uid: auth_hash["uid"]
      user.save

      render text: "Hi #{user.fname}! You've signed up."
    end
  end

  def failure
    render text: "You need to allow access to our app"
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
