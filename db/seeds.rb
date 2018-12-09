10.times do |n|
  title  = Faker::Name.unique.name
  List.create!(title:  title)
end

