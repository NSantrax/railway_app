STATIONS = ["MOSCOV", "KAZAN", "KRASNODAR", "ROSTOV"]

User.destroy_all
RailwayStation.destroy_all
Route.destroy_all
Train.destroy_all

5.times do |n|
  email = "test#{n + 1}@test.ru"
  password = "12345678"
  User.create(
    first_name: "Name-#{n}",
    last_name: "Surname-#{n}",
    email: email,
    password: password,
    password_confirmation: password,
    confirmed_at: Time.now)
end

User.create(
  first_name: "Admin_name",
  last_name: "Admin_surname",
  email: "admin@test.ru",
  password: "12345678",
  password_confirmation: "12345678",
  confirmed_at: Time.now,
  admin: true
)

STATIONS.each do |station|
  RailwayStation.create(title: station)
end

5.times do |n|
  Route.create(name: "ABC-#{n}")
end

5.times do |n|
  route = Route.where(name: "ABC-#{n}").first
  train = Train.create(number: "#{n}-00-A", route_id: route.id)
end
