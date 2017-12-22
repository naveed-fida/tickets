# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.destroy_all
Ticket.destroy_all
Tag.destroy_all

wall = Project.create(
  name: 'The Wall',
  description: "We're going to build a great wall. It's going to be a big, beautiful wall. We have to build the wall, we have no choice. Now let me tell you who's going to pay for it. Are you ready? ARE YOU READY?"
)

dam = Project.create(
  name: 'The Dam',
  description: "We'll build a dam. A beautiful dam but obviously not as beautiful as the wall. It's going to generate electricity. Can you believe that; a dam where you generate electricity?"
)

t1 = Ticket.create(
  name: 'Issue 1',
  body: "A serious issue. Very serious!",
  status: 'new',
  project: wall
)

t2 = Ticket.create(
  name: 'Issue 2',
  body: "A serious issue. Very serious!",
  status: 'in_progress',
  project: dam
)

Tag.create(name: 'Urgent').tickets << t1
Tag.create(name: 'More info needed').tickets << t1
