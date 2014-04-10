object @survey
attribute :id
attribute :description => :name

node :questions do
  @questions.map do |q|
    if q.is_a?(Mcq4)
       { "mcq4" => partial("mcq4s/show", :object => q) }
    else
       { "ynq" => partial("ynqs/show", :object => q) }
    end
  end
end

