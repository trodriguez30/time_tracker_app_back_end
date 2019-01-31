json.array! @projects do |project|
  json.(project, :id, :title, :user_id)
end