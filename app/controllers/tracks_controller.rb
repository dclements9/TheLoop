class TracksController < ApplicationController
    get '/show' do
        erb :'/tracks/show'
    ends

    get '/tracks' do
        @tracks = Track.all
        erb :'/tracks/all'
    end
end