class SessionsController < ApplicationController

  def new
  end

  def signin
    redirect_to dbc_auth
  end

  def auth
    puts "at auth and the params are #{params.inspect}"
    token = get_oauth_token(params[:code])
    user_data = get_user(token)
    user_attributes = JSON.parse(user_data.body)
    session[:user_attributes] = user_attributes
    session[:oauth_token] = token_as_hash(token)

    @user = User.find_by(:oauth_token => session[:oauth_token][:token])
    puts "User after find_by #{@user}"
    if !@user
      @user = User.create!(:oauth_token => session[:oauth_token][:token], :email=> session[:user_attributes]['email'], 
        :name=> session[:user_attributes]['name'])
      puts "User after create #{@user}"
    end
    puts "----------------------------------------"
    puts "the session has: #{session[:oauth_token].inspect}"

    session.clear
    session[:user_id] = @user.id

    redirect_to root_path
  end

  def logout
    session.clear
    redirect_to root_path
  end

  private

  def oauth_client
    raise RuntimeError, "You must set DBC_CLIENT_ID and DBC_CLIENT_SECRET in your server environment." unless ENV['DBC_CLIENT_ID'] && ENV['DBC_CLIENT_SECRET']
    OAuth2::Client.new(ENV['DBC_CLIENT_ID'], ENV['DBC_CLIENT_SECRET'], :site => 'https://auth.devbootcamp.com')
  end

  def dbc_auth
    puts "at dbc_auth"
    # if !session[:oauth_token]
    #   oauth_client.auth_code.authorize_url(redirect_uri: 'https://auth.devbootcamp.com')
    # else
      oauth_client.auth_code.authorize_url(redirect_uri: 'http://localhost:3000/sessions/auth')
    # end
  end

  def get_oauth_token(code)
    puts "at get oauth token"
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