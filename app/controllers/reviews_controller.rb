class ReviewsController < ApplicationController
    get '/new' do
        erb :'/reviews/new'
    end

    post '/new' do
        
        erb :show
    end
end