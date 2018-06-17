class LeaderboardController < ApplicationController
    def index
        @users = User.order(points: :desc)
        #@current_user = 
    end
end
