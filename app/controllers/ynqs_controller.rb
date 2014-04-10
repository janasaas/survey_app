class YnqsController < ApplicationController
before_filter :authenticate_user!
def create   
  @current_survey_id = session[:current_survey_id]
  @question_count = session[:question_count]
  @params = ynq_params
  @params[:question_count] = @question_count + 1
  @current_survey = Survey.find(@current_survey_id)
  @ynq = @current_survey.ynqs.build(@params)
  if @ynq.save
    flash[:success] = "Yes/No question created successfully"
    @question_count += 1
    session[:question_count] = @question_count
    redirect_to questions_new_url
  else
    logger.fatal"Fail to write in the server"
    flash.now[:error] = 'Server Error'
  end
end

private
def ynq_params
  params.require(:ynq).permit(:question, :question_count)                               
end

end
