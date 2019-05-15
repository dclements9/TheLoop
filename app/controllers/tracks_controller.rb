class TracksController < ApplicationController
    get '/tracks/:id' do
        @track = Track.find(params[:id])
        erb :'tracks/show'
    end

    get '/tracks' do
        @tracks = Track.all
        erb :'/tracks/all'
    end
end