class UsersController < ApplicationController

    get '/users/new' do
       erb :'/users/new'
    end

    post '/users' do
        binding.pry
        @user = User.create(params)
    end
end