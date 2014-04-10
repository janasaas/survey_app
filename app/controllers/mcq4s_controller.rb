class Mcq4sController < ApplicationController
before_filter :authenticate_user!
def create   
  @current_survey_id = session[:current_survey_id]
  @question_count = session[:question_count]
  @params = mcq4_params
  @params[:question_count] = @question_count + 1
  @current_survey = Survey.find(@current_survey_id)
  @mcq4 = @current_survey.mcq4s.build(@params)
  if @mcq4.save
    flash[:success] = "Multiple choice question created successfully"
    @question_count += 1
    session[:question_count] = @question_count
    redirect_to questions_new_url
  else
    logger.fatal"Fail to write in the server"
    flash.now[:error] = 'Server Error'
  end
end

private
def mcq4_params
  params.require(:mcq4).permit(:question, :a, :b, :c, :d, :question_count)                               
end

end
