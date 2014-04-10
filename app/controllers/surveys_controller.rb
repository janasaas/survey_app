class SurveysController < ApplicationController
before_filter :authenticate_user!
def new
end

def create
  @survey = current_user.surveys.build(survey_params)
  if @survey.save
    session[:current_survey_id] = @survey.id
    session[:question_count] = 0;
    redirect_to questions_new_url
  else
    logger.fatal "Fail to write in the server"
    flash.now[:error] = 'Server Error' 
  end
end

private
def survey_params
  params.require(:survey).permit(:description)                               
end

end

