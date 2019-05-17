class ReviewsController < ApplicationController
    get '/reviews/new' do
        @tracks = Track.all
        erb :'/reviews/new'
    end

    post '/reviews/new' do
        @tracks = Track.all
        if params[:track_radio] == "" && params[:track][:name] == ""
            @params_check = false
            erb :'/reviews/new'
        elsif params[:track_radio] != "" && params[:track][:name] != ""
            @params_single_checked = false
            erb :'/reviews/new'
        else
            @review = Review.new(params[:review])
            if params[:track_radio] != ""
                @track = Track.find(params[:track_radio])
            elsif params[:track][:name] != ""
                @track = Track.create(params[:track]) 
            end
            @review.track_name = @track.name
            @review.user_id=session[:user_id]

            @review.track_id=@track.id     
            @review.save
            redirect "reviews/#{@review.id}"
        end
    end

    get '/reviews/all' do
        @reviews = Review.all
        @user = User.find(session[:user_id])   
        erb :'/reviews/all'
    end

    get '/reviews/all_user_reviews' do
        if  !logged_in?
            redirect '/failure'    
        else
            @reviews = Review.all
            @user = User.find(session[:user_id])
            erb :'/reviews/user_all'
        end
    end

    get '/reviews/:id' do
        if !logged_in?
            erb :'/users/not_logged_in'
        else
            @review = Review.find(params[:id])
            @user = User.find(session[:user_id])
            erb :'reviews/show'
        end
    end
    
    get '/reviews/:id/edit' do
        @tracks = Track.all
        if !logged_in?
            redirect '/failure'
        else
            if @review = current_user.reviews.find_by(params[:id ])
                @user = User.find(session[:user_id])
                erb :'reviews/edit'
            else
                redirect '/all_user_reviews'
            end
        end
    end

    patch '/reviews/:id' do
        @tracks = Track.all
        @review = Review.find(params[:id])
        if params[:track_radio] == "" && params[:track][:name] == ""
            @params_check = false
            erb :'/reviews/edit'
        elsif params[:track_radio] != "" && params[:track][:name] != ""
            @params_single_checked = false
            erb :'/reviews/edit'
        else
            @review.update(params[:review])
            if params[:track_radio] !=0 && params[:track][:name]
                @track = Track.find_by(params[:track_radio])
                @review.track_name = @track.name
            elsif params[:track][:name] != ""
                @track = Track.create(params[:track]) 
                @review.track_name = params[:track][:name]
            end
            @review.save
            redirect "reviews/#{@review.id}"
        end
    end

    get '/reviews/:id/delete' do
        if !logged_in?
            redirect '/failure'
        else
            @review = Review.find(params[:id])
            @review.destroy
            redirect '/home'
        end
    end

end