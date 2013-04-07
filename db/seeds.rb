# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cohort.delete_all

[
{name: 'Sea Lions', start_date: DateTime.new(2013, 01, 28), email: 'lions@devbootcamp.com'},
{name: 'Banana Slugs', start_date: DateTime.new(2013, 02, 18), email: 'slugs@devbootcamp.com'},
{name: 'Golden Bears', start_date: DateTime.new(2013, 03, 11), email: 'bears@devbootcamp.com'},
{name: 'Fiery Skippers', start_date: DateTime.new(2013, 04, 01), email: 'skippers@devbootcamp.com'}
].each do |cohort|
  Cohort.create(cohort)
end
