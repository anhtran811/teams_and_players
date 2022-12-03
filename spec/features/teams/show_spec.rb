require 'rails_helper'

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
#   (data from each column that is on the parent table)

RSpec.describe 'Team Show' do
  describe 'As a visitor' do
    it 'can visit a specific teams show page /teams/:id, ' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      visit "/teams/#{team.id}"
      
      expect(current_path).to eq("/teams/#{team.id}")
    end
    
    it 'can display the team with the id including the teams attributes' do
      team= Team.create!(name: 'Spain', rank: 7, qualified: true)
    
      visit "/teams/#{team.id}"

      expect(page).to have_content('Spain')
      expect(page).to have_content(7)
      expect(page).to have_content(true)
    end

    it 'can see the number of players associated with this team' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      koke = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)
      gavi = Player.create!(name: 'Gavi', age: 18, old_enough: false, team_id: team.id)

      visit "/teams/#{team.id}"

      expect(page).to have_content('Total Roster')
      expect(page).to have_content("#{team.player_count}")
    end

    it 'I can see a link at the top of the page that takes me to the player index' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)

      visit "/teams/#{team.id}"

      click_link('Player Index')
      expect(current_path).to eq('/player_table_name')
    end
  end
end