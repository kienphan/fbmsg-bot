# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

yml_file = File.join(Rails.root, 'db/fixtures', 'sicknesses.yml')
sicknesses = YAML.load_file(yml_file).map do |sickness|
  Sickness.create(sickness)
end
