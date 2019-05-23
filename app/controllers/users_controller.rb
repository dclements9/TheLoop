class UsersController < ApplicationController

    get '/signup' do
       erb :'/users/signup'
    end

    post '/signup' do
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            login(params[:username], params[:password])
            redirect '/home'
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
            @user = User.find_by(username: params[:username])
        if !@user
            @username_error_message = "Username is incorrect."
            erb :'/users/login'
        elsif !@user.authenticate(params[:password]) 
            @password_error_message = "Password is incorrect."
            erb :'/users/login'
        else
            login(params[:username], params[:password])      
        end
    end

    get "/home" do
        if  !logged_in?
            erb :'/users/not_logged_in'   
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