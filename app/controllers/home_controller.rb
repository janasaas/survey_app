class HomeController < ApplicationController
before_filter :authenticate_user!
def user
  session.delete(:current_survey_id)
  session.delete(:question_count)
  @surveys = current_user.surveys
end

def dash
end

def start
end

end
