json.array!(@student_surveys) do |student_survey|
  json.extract! student_survey, :id
  json.url student_survey_url(student_survey, format: :json)
end
