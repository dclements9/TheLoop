require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "TkoccuhEbih2RMrksMeyYAqW"
  end

  get "/" do
    erb :welcome
  end

## Need to implement
  helpers do
    def logged_in?
      !!session[:user_id]
    end
    
    def login(username, password)
      session[:username] = username
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/home"
      else
        redirect "/login"
      end
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
