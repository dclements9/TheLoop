class UsersController < ApplicationController

    get '/users/new' do
       erb :'/users/new'
    end

    post '/users' do
        @user = User.create(params)
    end
end