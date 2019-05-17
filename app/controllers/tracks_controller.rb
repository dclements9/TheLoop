class TracksController < ApplicationController
    get '/tracks/all' do
        @tracks = Track.all
        erb :'/tracks/all'
    end

    get '/tracks/:id' do
        @track = Track.find(params[:id])
        erb :'tracks/show'
    end
end