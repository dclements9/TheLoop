class UsersController < ApplicationController

    get '/signup' do
       erb :'/users/signup'
    end

    post '/signup' do
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            redirect '/login'
        else
            erb :'/users/signup'
        end
    end

    get '/login' do
        erb :'/users/login'
    end

    get '/failure' do
        erb :'/users/failure'
    end

    post "/login" do
        login(params[:username], params[:password])    
    end

    get "/home" do
        if  !logged_in?
            redirect '/failure'    
        else
            @user = User.find(session[:user_id])
            erb :'/users/home'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end