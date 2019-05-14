class TracksController < ApplicationController
    get '/show' do
        erb :'/tracks/show'
    end

    get '/tracks' do
        @tracks = Track.all
        erb :'/tracks/all'
    end
end