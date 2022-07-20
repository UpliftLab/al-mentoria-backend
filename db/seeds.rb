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
    name: "Soufiane Boursen",
    photo: "https://twitter.com/sboursen_dev/photo",
    bio: "Full-stack software developer. PostgreSQL, Ruby on Rails, React, Tailwind. Machine learning enthusiast. R&D process engineer. Open to new opportunities.",
  },
  {
    user: User.first,
    name: "Awais Amjed",
    photo: "https://avatars.githubusercontent.com/u/73714615",
    bio: "Full-stack software developer, React & Redux enthusiast, part-time Freelancer, Love Flutter, Music, Gaming, and Movies. Open to new opportunities!",
  },
  {
    user: User.first,
    name: "Mostafa Ahangarha",
    photo: "https://avatars.githubusercontent.com/u/11241315",
    bio: "Full-Stack Developer | React, Rails, Laravel | Software Freedom advocate | Looking for new opportunities.",
  },
  {
    user: User.first,
    name: "Ammar Hamlaoui",
    photo: "https://avatars.githubusercontent.com/u/20567503",
    bio: "Software Engineer & Full-Stack Web Developer | React | JavaScript | Git | SQL, currently looking for opportunities.",
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
