class ReviewsController < ApplicationController
    get '/new' do
        erb :'/reviews/new'
    end

    get '/reviews/:id' do
        @review = Review.find(params[:id])
        erb :'reviews/show'
    end

    post '/new' do
        @review = Review.create(params)
 
        redirect "reviews/#{@review.id}"
        
    end


    get '/all' do
        erb :'/reviews/all'
    end
end