class ResultsController < ApplicationController
    def show
        @user = current_user
    end

    def index
      @user = current_user
      @results = Result.order(created_at: :desc)
      if @user == nil
        redirect_to new_session_path
      end
    end
end
