# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create!([
  {
    name: "Soufiane",
    email: "soufiane@nomail.com",
    password: "123123",
    role: "admin",
  },
  {
    name: "Donald",
    email: "donald@nomail.com",
    password: "123123",
  },
  {
    name: "Sansa",
    email: "sansa@nomail.com",
    password: "123123",
  },
  {
    name: "layla",
    email: "Layla@nomail.com",
    password: "123123",
  },
])

topics = Topic.create!([
  {
    label: "Rails",
    icon: "https://download.logo.wine/logo/Ruby_on_Rails/Ruby_on_Rails-Logo.wine.png",
  },
  {
    label: "React",
    icon: "https://download.logo.wine/logo/React_(web_framework)/React_(web_framework)-Logo.wine.png",
  },
  {
    label: "Bootstrap",
    icon: "https://download.logo.wine/logo/Bootstrap_(front-end_framework)/Bootstrap_(front-end_framework)-Logo.wine.png",
  },
  {
    label: "Laravel",
    icon: "https://download.logo.wine/logo/Laravel/Laravel-Logo.wine.png",
  },
  {
    label: "Node.js",
    icon: "https://download.logo.wine/logo/Node.js/Node.js-Logo.wine.png",
  },

])

mentors = Mentor.create!([
  {
    user: User.first,
    name: "Da Rock",
    photo: "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
    bio: "I am a mentor from mars",
  },
  {
    user: User.first,
    name: "Awais",
    photo: "http://m.gettywallpapers.com/wp-content/uploads/2020/04/Cute-iPhone-Background.jpg",
    bio: "I am a mentor from Da void",
  },
  {
    user: User.first,
    name: "Mostafa",
    photo: "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
    bio: "I am a mentor from mars",
  },
  {
    user: User.first,
    name: "Ammar",
    photo: "https://avatars.githubusercontent.com/u/20567503?s=400&u=e1b144198e38c032096f11917b2317f66475700f&v=4",
    bio: "I am a mentor from the multiverse",
  },
])

mentor_topics = MentorTopic.create!([
  {
    topic: Topic.first,
    mentor: Mentor.second,
    rating: 0.5,
  },
  {
    topic: Topic.second,
    mentor: Mentor.third,
    rating: 5,
  },
  {
    topic: Topic.third,
    mentor: Mentor.first,
    rating: 4,
  },
  {
    topic: Topic.last,
    mentor: Mentor.second,
    rating: 3,
  },
])

reservations = Reservation.create!([
  {
    mentor_topic: MentorTopic.first,
    user: User.second,
    date: Time.now.utc.to_date,
  },
  {
    mentor_topic: MentorTopic.second,
    user: User.second,
    date: Time.now.utc.to_date,
  },
  {
    mentor_topic: MentorTopic.last,
    user: User.last,
    date: Time.now.utc.to_date,
  },
])
