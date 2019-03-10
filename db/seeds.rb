User.create!([
  {email: "bf@email.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, username: "bestfriends"},
  {email: "nk@email.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, username: "nkla"},
  {email: "tk@email.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, username: "tinykittens"}
])
Litter.create!([
  {name: "R8 2018", start_date: "2018-05-06", end_date: "2018-06-13", with_mom: false, mom_name: nil},
  {name: "D4 2018", start_date: "2018-04-01", end_date: "2018-04-26", with_mom: false, mom_name: nil},
  {name: "M21", start_date: "2016-08-09", end_date: "2016-09-03", with_mom: false, mom_name: nil},
  {name: "V18", start_date: "2018-07-01", end_date: "2018-07-31", with_mom: false, mom_name: nil},
  {name: "P41", start_date: "2017-11-27", end_date: "2017-12-24", with_mom: false, mom_name: nil}
])
Kitten.create!([
  {user_id: 1, litter_id: 1, name: "Rita", sex: false, color: "tabby", image: "Rita.JPG", dob: "2018-03-21"},
  {user_id: 1, litter_id: 1, name: "Ronald", sex: true, color: "gray & white", image: "Ronald.JPG", dob: "2018-03-21"},
  {user_id: 1, litter_id: 1, name: "Ripli", sex: false, color: "calico", image: "Ripli.JPG", dob: "2018-03-21"},
  {user_id: 1, litter_id: 1, name: "Rupert", sex: true, color: "black & white", image: "Rupert.JPG", dob: "2018-03-21"},
  {user_id: 1, litter_id: 2, name: "Dublin", sex: true, color: "gray", image: "Dublin1.JPG", dob: "2018-02-24"},
  {user_id: 1, litter_id: 2, name: "Daylor", sex: true, color: "gray & white", image: "Daylor.JPG", dob: "2018-02-24"},
  {user_id: 1, litter_id: 2, name: "Daria", sex: false, color: "gray", image: "Daria.JPG", dob: "2018-02-24"},
  {user_id: 1, litter_id: 2, name: "Dieter", sex: true, color: "gray & white", image: "Dieter.JPG", dob: "2018-02-24"},
  {user_id: 1, litter_id: 2, name: "Darlene", sex: false, color: "gray & white", image: "Darling1.JPG", dob: "2018-02-24"},
  {user_id: 2, litter_id: 3, name: "Mabel", sex: false, color: "white & gray", image: "Mabel2.png", dob: nil},
  {user_id: 2, litter_id: 3, name: "Maddie", sex: false, color: "white & gray", image: "Maddie2.png", dob: nil},
  {user_id: 2, litter_id: 3, name: "Mandy", sex: false, color: "black & white", image: "Mandy1.png", dob: nil},
  {user_id: 2, litter_id: 3, name: "Miles", sex: true, color: "white & gray", image: "Miles.png", dob: nil},
  {user_id: 2, litter_id: 3, name: "Maxwell", sex: true, color: "white & gray", image: "Maxwell.png", dob: nil},
  {user_id: 2, litter_id: 3, name: "Mazie", sex: false, color: "gray & white", image: "Mazie.png", dob: nil},
  {user_id: 2, litter_id: 3, name: "Mozy", sex: true, color: "white & gray", image: "Mozy1.png", dob: nil},
  {user_id: 2, litter_id: 4, name: "Velvet", sex: false, color: "black & white", image: "IMG_6856.JPG", dob: "2018-05-17"},
  {user_id: 2, litter_id: 4, name: "Viking", sex: false, color: "black", image: "Viking2.JPG", dob: nil},
  {user_id: 2, litter_id: 4, name: "Vice", sex: true, color: "black & white", image: "Vice.JPG", dob: "2018-05-17"},
  {user_id: 2, litter_id: 5, name: "Porcupine", sex: true, color: "gray", image: "Porcupine2.JPG", dob: nil},
  {user_id: 2, litter_id: 5, name: "Papoose", sex: false, color: "seal point", image: "Papoose1.jpg", dob: nil}
])
