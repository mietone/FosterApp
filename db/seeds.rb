User.create!([
  {email: "bf@email.com", encrypted_password: "$2a$11$tN3KDgvXOZiL2D1Ll9KlYO7mPuq8lJNKAv0oV7FFT3hfcKXhza2ey", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, username: "bestfriends"},
  {email: "nk@email.com", encrypted_password: "$2a$11$h6a0MmhUU5LfLiUuKccEw.iPKp/2GxTWoECNKzDx9KnWEM68cS9Ru", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, username: "nkla"},
  {email: "gominanoyo@yahoo.com", encrypted_password: "$2a$11$Eyox8UOwYi0O2uFrtpOcj.Mv1G7r6WLyGHZihEyEFjKzBn8uWoxRS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, username: "Joey Hudson"},
  {email: "tk@email.com", encrypted_password: "$2a$11$7ewhW9yhs/k/VaMxy92JUu6ZFCBGSA2JFT5EiOrRapbv8kpP7mQVy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, username: "tinykittens"}
])
Identity.create!([
  {uid: "2295328447164012", provider: "facebook", user_id: 3}
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
  {user_id: 2, litter_id: 5, name: "Papoose", sex: false, color: "seal point", image: "Papoose1.jpg", dob: nil},
  {user_id: 6, litter_id: 7, name: "Zaba", sex: false, color: "white & gray", image: "Zaba.JPG", dob: "2018-07-06"},
  {user_id: 6, litter_id: 7, name: "Zam", sex: true, color: "black & white", image: "Zam.JPG", dob: "2018-07-06"},
  {user_id: 1, litter_id: 8, name: "Cormorant", sex: true, color: "white & gray", image: "cormorant_01.jpeg", dob: nil}
])
Litter.create!([
  {name: "R8 2018", start_date: "2018-05-06", end_date: "2018-06-13", with_mom: false, mom_name: nil},
  {name: "D4 2018", start_date: "2018-04-01", end_date: "2018-04-26", with_mom: false, mom_name: nil},
  {name: "M21", start_date: "2016-08-09", end_date: "2016-09-03", with_mom: false, mom_name: nil},
  {name: "V18", start_date: "2018-07-01", end_date: "2018-07-31", with_mom: false, mom_name: nil},
  {name: "P41", start_date: "2017-11-27", end_date: "2017-12-24", with_mom: false, mom_name: nil},
  {name: "Z25 2018", start_date: "2018-08-09", end_date: "2018-10-07", with_mom: false, mom_name: nil},
  {name: "C5 2017", start_date: "2017-08-03", end_date: "2017-08-18", with_mom: true, mom_name: "Chickadee"}
])
