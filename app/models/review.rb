class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :tracks
    attr_accessor  :overall, :vendors, :child_friendly, :walkability, :crowds, :comments
    

    def initialize(params)
        @overall = params[:overall]
        @vendors = params[:vendors]
        @child_friendly = params[:child_friendly]
        @walkability = params[:walkability]
        @crowds = params[:crowds]
        @comments = params[:comments]
        binding.pry      
    end  
end