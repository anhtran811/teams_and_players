require 'rails_helper'

RSpec.describe 'Player creation' do
  describe 'As a visitor' do
    describe 'When I visit a Team Player Index page' do
      it "then I see a link called 'Create Player' to add a new adopable player for that team called" do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
  
        visit "/teams/#{spain.id}/players"

        click_link("Create Player for #{spain.name}")

        expect(current_path).to eq("/teams/#{spain.id}/players/new")
      end

      it 'can create a new player' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)

        visit "/teams/#{team.id}/players/new"

        fill_in('Name', with: 'Pedri')
        fill_in('Age', with: '26')
        fill_in('Old enough', with: 'true')
       
        click_button('Create Player')
    
        expect(current_path).to eq("/teams/#{team.id}/players")
        expect(page).to have_content('Pedri')
        expect(page).to have_content('26')
        expect(page).to have_content('true')
      end
    end
  end
end