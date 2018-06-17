class ResultsController < ApplicationController
    def show
        @user = User.last
    end
end
