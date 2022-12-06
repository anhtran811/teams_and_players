require 'rails_helper'

RSpec.describe 'Player Index' do
  describe 'As a visitor' do
    describe "When I visit my players index page '/players" do
      it 'I can see the players attributes' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)

        visit '/players'

        expect(page).to have_content('Koke')
        expect(page).to have_content(30)
        expect(page).to have_content(true)
      end

      it 'I will only see the records where the old enough column is true' do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = spain.players.create!(name: 'Koke', age: 30, old_enough: true)
        gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
        torres = spain.players.create!(name: 'Torres', age: 35, old_enough: true)

        visit '/players'

        expect(page).to have_content(koke.name)
        expect(page).to have_content(koke.age)
        expect(page).to have_content(koke.old_enough)
        expect(page).to_not have_content(gavi.name)
        expect(page).to_not have_content(gavi.age)
        expect(page).to_not have_content(gavi.old_enough)
        expect(page).to have_content(torres.name)
        expect(page).to have_content(torres.age)
        expect(page).to have_content(torres.old_enough)
      end

      it 'can see a link next to every player to edit the player' do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = spain.players.create!(name: 'Koke', age: 30, old_enough: true)
        torres = spain.players.create!(name: 'Torres', age: 35, old_enough: true)
        
        visit '/players'
        click_link("Edit: #{koke.name}")

        expect(current_path).to eq("/players/#{koke.id}/edit")
        
        visit '/players'
        click_link("Edit: #{torres.name}")

        expect(current_path).to eq("/players/#{torres.id}/edit")
      end
    end
  end
end