class ResultsController < ApplicationController
    
    def create
        resParams = params.require(:result)
        @quiz = Quiz.find(resParams[:quiz])
        correct_questions = resParams.values.count { |value| value == "true" }
        total_questions = resParams[:questions_number]
        myscore = score(correct_questions,total_questions.to_f)
        if(myscore>=@quiz.passmark)
           claimed = "true"
        else
           claimed = "false"
        end
        result = Result.new user_id: current_user.id, quiz_id: @quiz.id, tries:1, score:myscore, claimed:claimed
           if result.save
              redirect_to user_result_path(result)    
           else
              redirect_to user_result_path(result)
           end
      end


    def edit
        @result = Result.find(params[:id])
    end

      def update
        resParams = params.require(:result)
        @quiz = Quiz.find(resParams[:quiz])
        correct_questions = resParams.values.count { |value| value == "true" }
        total_questions = resParams[:questions_number]
        myscore = score(correct_questions,total_questions.to_f)
        if(myscore>=@quiz.passmark)
           claimed = "true"
        else
           claimed = "false"
        end
        result = Result.neupdate user_id: current_user.id, quiz_id: @quiz.id, tries:1+1, score:myscore, claimed:claimed
           if result.update
              redirect_to user_result_path(result)    
           else
              redirect_to user_result_path(result)
           end
    end
    
    def show

    end
    
    def index
      @user = current_user
      @results = Result.order(created_at: :desc)
      if @user == nil
        redirect_to new_session_path
      end
    end
    
   private  
    def score(correct, total)
        correct/total *100      
    end
end
