class V1::SurveysController < ApplicationController

  def questions
    @survey_id = params[:id]
    @survey = Survey.find(@survey_id)
    @mcq4s = @survey.mcq4s
    @ynqs = @survey.ynqs
    @questions = @ynqs + @mcq4s
    @questions.sort_by! { |h| h[:question_count] }
  end


  def list
    @surveys = current_user.surveys
  end

  skip_before_action :verify_authenticity_token
  def answers
    @agent_details = params[:survey][:agent]
    @surveyee_details = params[:survey][:surveyee]
    @answers = params[:survey][:answers]  

    #Check agent phone if available, else create

    @survey_id = params[:survey][:id]
    @survey = Survey.find(@survey_id)
    @agent_phone = @agent_details[:phone]
    @agent = Agent.find_by_phone(@agent_phone)
    if @agent == nil
        @agent = Agent.create(agent_params)
        #Agent.save
    end

    @surveyee_phone = @surveyee_details[:phone]
    @surveyee = Surveyee.find_by_phone(@surveyee_phone)
    if @surveyee == nil
        @surveyee = Surveyee.create(surveyee_params)
        #Surveyee.save
    end

    @response_params = { :agent_id => @agent.id, :surveyee_id => @surveyee.id }
    @response = @survey.responses.build(@response_params)
    @response.save


    @mcq4s = @survey.mcq4s
    @ynqs = @survey.ynqs


    @questions = @ynqs + @mcq4s
    @questions.sort_by! { |h| h[:question_count] }


    @count = 0
    
    @answers.each do |answer|
       if answer.has_key?(:mcq4)
	 if @questions[@count][:question_count] == answer[:mcq4][:id]
	   @result_params = {:response_id => @response.id, :answer => answer[:mcq4][:answer] }
	   @result = @questions[@count].results.build(@result_params)
	   @result.save
         end
	
       else   
        if @questions[@count][:question_count] == answer[:ynq][:id]
	  @result_params = {:response_id => @response.id, :answer => answer[:ynq][:answer] }
          @result = @questions[@count].results.build(@result_params)
          @result.save
        end
       end

       @count += 1

    end
  end

private
  def agent_params
    params.require(:survey).require(:agent).permit(:first_name, :last_name, :phone)
  end

  def surveyee_params
    params.require(:survey).require(:surveyee).permit(:first_name, :last_name, :email, :phone, :age, :sex, :address_1, :address_2, :city, :state, :country, :zip_code, :latitude, :longitude)
  end
end
