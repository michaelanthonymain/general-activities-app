class SessionsController < ApplicationController

  def new
  end

  def signin
    redirect_to dbc_auth
  end

  def auth
    token = get_oauth_token(params[:code])
    user_data = get_user(token)
    user_attributes = JSON.parse(user_data.body)
    session[:user_attributes] = user_attributes
    session[:oauth_token] = token_as_hash(token)
    dbc_user = DBC::User.find(user_attributes["id"])

    @user = User.find_by(:oauth_token => session[:oauth_token][:token])
    if !@user
      @user = User.create!(oauth_token: session[:oauth_token][:token], 
        email: session[:user_attributes]['email'], 
        name: session[:user_attributes]['name'],
        cohort: dbc_user.cohort.name,
        avatar_url: session[:user_attributes]['avatar_image_url'])
    end

    reset_session
    session[:user_id] = @user.id
    
    redirect_to root_path
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private

  def oauth_client
    raise RuntimeError, "You must set DBC_CLIENT_ID and DBC_CLIENT_SECRET in your server environment." unless ENV['DBC_CLIENT_ID'] && ENV['DBC_CLIENT_SECRET']
    OAuth2::Client.new(ENV['DBC_CLIENT_ID'], ENV['DBC_CLIENT_SECRET'], :site => 'https://auth.devbootcamp.com')
  end

  def dbc_auth
    oauth_client.auth_code.authorize_url(redirect_uri: 'http://localhost:3000/sessions/auth')
  end

  def get_oauth_token(code)
    oauth_client.auth_code.get_token(code, redirect_uri: 'http://localhost:3000/sessions/auth')
  end

  def get_user(token)
    token.get('/me')
  end

  def token_as_hash(token)
  { token: token.token,
    refresh_token: token.refresh_token,
    expires_at: token.expires_at }
  end

end