json.array! @users do |user|
  json.(user, :id, :username, :name)
end