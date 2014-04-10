object @survey
attribute :id
attribute :description => :name

node :questions do
  @questions.map do |q|
    if q.is_a?(Mcq4)
       { "mcq4" => partial("v1/surveys/mcq4", :object => q) }
    else
       { "ynq" => partial("v1/surveys/ynq", :object => q) }
    end
  end
end
