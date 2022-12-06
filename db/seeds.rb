# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Team.destroy_all
Player.destroy_all

spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
england = Team.create!(name: 'England', rank: 5, qualified: true)
portugal = Team.create!(name: 'Portugal', rank: 9, qualified: true)
italy = Team.create!(name: 'Italy', rank: 6, qualified: false)

spain.players.create!(name: 'Koke', age: 30, old_enough: true)
spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
spain.players.create!(name: 'Torres', age: 35, old_enough: true)

england.players.create!(name: 'Kane', age: 29, old_enough: true)
england.players.create!(name: 'Foden', age: 21, old_enough: true)

portugal.players.create!(name: 'Ronaldo', age: 37, old_enough: true)
portugal.players.create!(name: 'Silva', age: 19, old_enough: true)

italy.players.create!(name: 'Bastoni', age: 23, old_enough: true)
italy.players.create!(name: 'Scalvini', age: 20, old_enough: false)




