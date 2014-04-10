class QuestionsController < ApplicationController
before_filter :authenticate_user!
def new
end

def create   
end

def show
  @survey_id = params[:survey_id]
  @survey = Survey.find(@survey_id)
  @mcq4s = @survey.mcq4s
  #@mcq4s = @mcq4s.to_a.map(&:serializable_hash)
  #@mcq4s = @mcq4s.each { |h| h[:type] = "mcq4"  }
  
  
  @ynqs = @survey.ynqs
  #@ynqs = @ynqs.to_a.map(&:serializable_hash)
  #@ynqs = @ynqs.each { |h| h[:type] = "ynq" }
  @questions = @ynqs + @mcq4s
  @questions.sort_by! { |h| h[:question_count] }
  
end
skip_before_action :verify_authenticity_token
def answers
  @data = ActiveSupport::JSON.decode(request.body)
end

end
