require 'rails_helper'

RSpec.describe 'Teams Players Index' do
  describe 'As a visitor' do
    describe "When I visit a Team Player Index page" do
      it 'can visit the Team Player index page /teams/:team_id/players' do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
      
        visit "/teams/#{spain.id}/players"

        expect(current_path).to eq("/teams/#{spain.id}/players")
      end
      
      it 'can see each Player that is associated with that Team and each Players attributes' do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
        torres = spain.players.create!(name: 'Torres', age: 25, old_enough: true)

        visit "/teams/#{spain.id}/players"

        expect(page).to have_content(spain.name)
        expect(page).to have_content(gavi.name)
        expect(page).to have_content(gavi.age)
        expect(page).to have_content(gavi.old_enough)
        expect(page).to have_content(torres.name)
        expect(page).to have_content(torres.age)
        expect(page).to have_content(torres.old_enough)
      end

      it 'can have a link that returns players alphabetically' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = team.players.create!(name: 'Koke', age: 30, old_enough: true)
        gave = team.players.create!(name: 'Gavi', age: 18, old_enough: false)
        torres = team.players.create!(name: 'Torres', age: 35, old_enough: true)

        visit "/teams/#{team.id}/players"
        click_link ("#{team.name} players listed alphabetically")

        expect(current_path).to eq("/teams/#{team.id}/players")
        expect(page).to have_content('Koke')
        expect(page).to have_content('Gavi')
        expect(page).to have_content('Torres')
        expect(page).to_not have_content('Pique')
      end

      it 'can see a link next to every player to edit the player' do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = spain.players.create!(name: 'Koke', age: 30, old_enough: true)
        torres = spain.players.create!(name: 'Torres', age: 35, old_enough: true)
        
        visit "/teams/#{spain.id}/players"
        click_link("Edit: #{koke.name}")

        expect(current_path).to eq("/players/#{koke.id}/edit")
        
        
        visit "/teams/#{spain.id}/players"
        click_link("Edit: #{torres.name}")

        expect(current_path).to eq("/players/#{torres.id}/edit")
      end

      it 'can see a form to input a minimum age' do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = spain.players.create!(name: 'Koke', age: 30, old_enough: true)
        torres = spain.players.create!(name: 'Torres', age: 35, old_enough: true)
        gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)

        visit "/teams/#{spain.id}/players"
        fill_in('age', with: '32')

        click_on ("Sort #{spain.name} players by maximum age")

        expect(current_path).to eq("/teams/#{spain.id}/players")
        expect(page).to have_content(koke.name)
        expect(page).to have_content(gavi.name)
        expect(page).to_not have_content(torres.name)
      end
    end
  end
end
