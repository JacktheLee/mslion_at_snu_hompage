# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AssignmentTitle.create(name: "Code Academy", description: "코드아카데미 jquery, ruby를 완료하여 인증샷!")
User.create(email: "cokr3430@gmail.com", name: "정유철", password: "12341234", password_confirmation: "12341234", authority: "admin")
