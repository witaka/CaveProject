class LeaderboardController < ApplicationController
    def index
        @users = User.order(points: :desc)
    end
end
