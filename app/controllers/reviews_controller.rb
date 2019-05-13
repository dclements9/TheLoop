class ReviewsController < ApplicationController
    get '/new' do
        erb :'/reviews/new'
    end

    post '/new' do

        erb :'/reviews/show'
    end

    get '/all' do
        erb :'/reviews/all'
    end
end