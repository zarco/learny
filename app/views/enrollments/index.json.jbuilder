json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :workshop_id, :student_id
  json.url enrollment_url(enrollment, format: :json)
end
