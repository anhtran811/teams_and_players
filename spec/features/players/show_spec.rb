require 'rails_helper'

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

RSpec.describe 'Player Show' do
  describe 'As a visitor' do
    it 'can visit a specific players show page /player_table_name/:id' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)
      player_2 = Player.create!(name: 'Gavi', age: 18, old_enough: false, team_id: team.id)
      
      visit "/player_table_name/#{player_1.id}"

      expect(current_path).to eq("/player_table_name/#{player_1.id}")

      visit "/player_table_name/#{player_2.id}"
      
      expect(current_path).to eq("/player_table_name/#{player_2.id}")
    end

    it 'can display the player with the id including the players attributes' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      player_1 = team.players.create!(name: 'Koke', age: 30, old_enough: true)
      player_2 = team.players.create!(name: 'Gavi', age: 18, old_enough: false)

      visit "/player_table_name/#{player_1.id}"
      
      expect(page).to have_content('Koke')
      expect(page).to have_content(30)
      expect(page).to have_content(true)
  
      visit "/player_table_name/#{player_2.id}"
      
      expect(page).to have_content('Gavi')
      expect(page).to have_content(18)
      expect(page).to have_content(false)
    end

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
    it 'I can see a link at the top of the page that takes me to the player index' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)
     
      visit "/player_table_name/#{player_1.id}"

      click_link('Player Index')

      expect(current_path).to eq('/player_table_name')
    end

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
    it 'I can see a link at the top of the page that takes me to the teams index' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)
    
      visit "/player_table_name/#{player_1.id}"

      click_link('Teams Index')

      expect(current_path).to eq('/teams')
    end
  end
end