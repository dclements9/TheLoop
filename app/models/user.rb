class User < ActiveRecord::Base
    has_many :reviews
    has_many :tracks, through: :reviews
    validates :username, presence: true
    validates :username, uniqueness: true
    has_secure_password
end