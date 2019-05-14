class ReviewsController < ApplicationController
    get '/new' do
        @tracks = Track.all
        erb :'/reviews/new'
    end

    get '/reviews/:id' do
        @review = Review.find(params[:id])
        erb :'reviews/show'
    end

    post '/new' do
        @review = Review.new(params[:review])
        binding.pry
        if params[:track][:name] != ""  
            @track = Track.create(params[:track]) 
        end
        binding.pry
        @review = 
        @review.save
        redirect "reviews/#{@review.id}"
    end

    get '/all' do
        erb :'/reviews/all'
    end
end