# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


teacher=Teacher.create(
    first_name:'Usman',
    last_name:'shahzad',
    email:'usmanshahzad904@gmail.com'

)

20.times do |i|
    puts "#{i+1}"
    Teacher.create(
    first_name:"Usman#{i+1}",
    last_name:"shahzad#{i+1}",
    email:"usmanshahzad#{i+1}@gmail.com"

)
end

Teacher.all.each do |teacher|
    teacher.blogs.create(
title:"Dummy blog for student#{teacher.id}",
content:"hvshvshASVHAjvsAJHSFUYAsiAS"
    )
    teacher.blogs.create(
        title:"Dummy blog for student#{teacher.id}",
        content:"hvshvshASVHAjvsAJHSFUYAsiAS"
            )

end