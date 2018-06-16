class LeaderboardController < ApplicationController
    def index
        @users = User.order(pts: :desc)
    end
end
