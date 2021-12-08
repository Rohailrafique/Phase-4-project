# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.reset_pk_sequence


kenny = User.create(email: "fitzgeraldkd@gmail.com", display_name: "kenny", username: "fitzgeraldkd", password_digest: BCrypt::Password.create('password123') , twitter_url: "", facebook_url: "", linkedin_url: "https://www.linkedin.com/in/kenneth-fitzgerald/", image_url: "https://i.imgur.com/5RA8IBG.jpg")
rohail = User.create(email: "rohail_shahid@hotmail.com", display_name: "rohail", username: "rohail", password_digest: BCrypt::Password.create('password123') , twitter_url: "", facebook_url: "", linkedin_url: "https://www.linkedin.com/in/rohail-rafique-1110882a/", image_url: "https://media-exp1.licdn.com/dms/image/C4D03AQEF_UGrG6jGVQ/profile-displayphoto-shrink_800_800/0/1636816685334?e=1644451200&v=beta&t=m2xhdsv5h9CdAHg2Krul8x2NKb_PPKF3dbrVgLWYQ2E")
adam = User.create(email: "adammooredev1@gmail.com", display_name: "adam", username: "amoore", password_digest: BCrypt::Password.create('password321') , twitter_url: "", facebook_url: "", linkedin_url: "https://www.linkedin.com/in/adam-moore-926b84227/", image_url: "https://miro.medium.com/max/1187/1*0FqDC0_r1f5xFz3IywLYRA.jpeg")

20.times do
  this_user = User.create(
    email: Faker::Internet.email,
    display_name: Faker::Name.name,
    username: Faker::Internet.username(separators: %w(_)),
    password: 'password',
    image_url: Faker::Avatar.image(slug: Faker::Lorem.word)
    # image_url: Faker::LoremFlickr.image(search_terms: ['cats', 'dogs'])
  )

  5.times do
    this_user.posts.create(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraphs(number: 12).join(' ')
    )
  end
end

Follower.create(follower: kenny, followed: rohail)

Post.create(user_id: 1, title: "test-blog", content: "blablabalblabl")
Post.create(user_id: 2, title: "test-blog", content: "asdad")
Post.create(user_id: 3, title: "test-blog", content: "blablabvvvvvvvalblabl")

