require 'rails_helper'

RSpec.describe 'Edit Player' do
  describe 'As a visitor' do
    describe 'When I visit a Player show page' do
      it "I see a link called 'Update Player' to edit that player" do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player_1 = team.players.create!(name: 'Koke', age: 30, old_enough: true)

        visit "/players/#{player_1.id}"
        click_link ("Update: #{player_1.name}")

        expect(current_path).to eq("/players/#{player_1.id}/edit")
      end

      it 'can update the player' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player = team.players.create!(name: 'Koe', age: 300, old_enough: true)

        visit "/players/#{player.id}/edit"

        fill_in('Name', with: 'Koke')
        fill_in('Age', with: '30')
        fill_in('Old enough', with: 'true')
        click_button 'Update Player'

        expect(current_path).to eq("/players/#{player.id}")
        expect(page).to have_content('Koke')
      end
    end
  end
end