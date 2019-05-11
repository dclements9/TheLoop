class UsersController < ApplicationController

    get '/signup' do
       erb :'/users/signup'
    end

    post '/signup' do
        if params[:username] == "" || params[:password] == ""
            redirect '/failure'
        else
            User.create(username: params[:username], password: params[:password])
            redirect '/login'
        end
    end

    get '/login' do
        erb :'/users/login'
    end

    get '/failure' do
        erb :'/users/failure'
    end

    post "/login" do
        @user = User.find_by(username: params[:username])
    
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect "/account"
        else
          redirect "/failure"
        end
    end

    get "/account" do
        @user = User.find(session[:user_id])
        if  @user
            erb :'/users/account'
        else
            redirect '/failure'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

    helpers do
        def logged_in?
          !!session[:user_id]
        end
    
        def current_user
          User.find(session[:user_id])
        end
    end
end