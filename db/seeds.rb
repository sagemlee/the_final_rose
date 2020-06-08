# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hannah = Bachelorette.create(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet")
rachel = Bachelorette.create(name: "Rachel Lindsay", season_number: 13, description: "The one with Rachel")

bob = Contestant.create(name: "Bob", age: 26, hometown: "Pasadena", bachelorette_id: hannah.id)
drew = Contestant.create(name: "Drew", age: 27, hometown: "Cleveland", bachelorette_id: hannah.id)
keith = Contestant.create(name: "Keith", age: 31, hometown: "Atlanta", bachelorette_id: rachel.id)
