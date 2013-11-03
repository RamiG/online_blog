# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

parent_id = Category.create(name: "Sports").id
Category.create(name: "Football", parent_id: parent_id)
Category.create(name: "Basketbal", parent_id: parent_id)
Category.create(name: "Golf", parent_id: parent_id)
sub_parent_id = Category.create(name: "Winter sports", parent_id: parent_id)
Category.create(name: "Hockey", parent_id: sub_parent_id)
Category.create(name: "Skiing", parent_id: sub_parent_id)
Category.create(name: "Ice skating", parent_id: sub_parent_id)

parent_id = Category.create(name: "Music").id
Category.create(name: "Rock", parent_id: parent_id)
Category.create(name: "Jaz", parent_id: parent_id)
Category.create(name: "Pop", parent_id: parent_id)

parent_id = Category.create(name: "Literature").id
Category.create(name: "Poem", parent_id: parent_id)
Category.create(name: "Story", parent_id: parent_id)
Category.create(name: "Tale", parent_id: parent_id)
