# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AssignmentTitle.create(name: "Code Academy", description: "코드아카데미 jquery, ruby를 완료하여 인증샷!")
User.create(email: "snu@likelion.net", name: "운영진", password: "$nulion2016", password_confirmation: "$nulion2016", authority: "admin")

# 4기 유저 시드
names = Snulion.get_member
emails = ["kimkyungdo08@gmail.com", "kbljm@naver.com", "topluv11@gmail.com", "rlaxodhksk@naver.com", "rr5ys5s@snu.ac.kr", "uk6342@gmail.com", "soobin3230@snu.ac.kr", "sonasd123@naver.com", "rltj9294@naver.com", "jyo3on@gmail.com", "me@jin0u.com", "yoonhy557@gmail.com", "lhm1442@snu.ac.kr", "jg0428.lim@gmail.com" ]
tels = ["41720816","33494108", "45924609", "67411367", "46552603", "35906342", "81077425", "72831029", "99449294", "51254582", "97979057", "71700785",  "96262305", "44364286"]
for i in 0..names.count
  User.create(email: emails[i], name: names[i], password: tels[i], password_confirmation: tels[i])
end
User.create(email: "grey_pastor@naver.com", name: "빻재성", password: "12341234", password_confirmation: "12341234")
User.create(email: "grey_pastor@naver.com", name: "빻유철", password: "12341234", password_confirmation: "12341234")
