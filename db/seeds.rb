# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cohort.delete_all

[
{name: 'Sea Lions', start_date: DateTime.new(2013, 01, 28), email: 'lions@devbootcamp.com', photos_url: nil},
{name: 'Banana Slugs', start_date: DateTime.new(2013, 02, 18), email: 'slugs@devbootcamp.com', photos_url: 'https://www.dropbox.com/sh/unxdinxldakcyc8/2_BhxGIPPw/gravatars'},
{name: 'Golden Bears', start_date: DateTime.new(2013, 03, 11), email: 'bears@devbootcamp.com', photos_url: 'https://www.dropbox.com/sh/ybnmqvw7vp76rf7/pUfAiDpmt1/gravatars'},
{name: 'Fiery Skippers', start_date: DateTime.new(2013, 04, 01), email: 'skippers@devbootcamp.com', photos_url: 'https://www.dropbox.com/sh/neh4rqse0mmh00x/WnSI8qQbPA/gravatar'}
].each do |cohort|
  Cohort.create(cohort)
end
