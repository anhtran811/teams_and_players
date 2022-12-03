require 'rails_helper'

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

RSpec.describe 'Teams Players Index' do
  describe 'As a visitor' do
    it 'can visit /teams/:team_id/player_table_name' do
      spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
      spain.players.create!(name: 'Gavi', age: 18, old_enough: false)

      visit "/teams/#{spain.id}/player_table_name"

      expect(current_path).to eq("/teams/#{spain.id}/player_table_name")
    end
    
    it 'can see each Player that is associated with that Team and each Players attributes' do
      spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
      gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
      torres = spain.players.create!(name: 'Torres', age: 25, old_enough: true)

      visit "/teams/#{spain.id}/player_table_name"

      expect(page).to have_content(spain.name)
      expect(page).to have_content(gavi.name)
      expect(page).to have_content(gavi.age)
      expect(page).to have_content(gavi.old_enough)
      expect(page).to have_content(torres.name)
      expect(page).to have_content(torres.age)
      expect(page).to have_content(torres.old_enough)
    end

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
    it 'I can see a link at the top of the page that takes me to the player index' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)

      visit "/teams/#{team.id}/player_table_name"

      click_link('Player Index')

      expect(current_path).to eq('/player_table_name')
    end

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
    it 'I can see a link at the top of the page that takes me to the teams index' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)

      visit '/player_table_name'

      click_link('Teams Index')

      expect(current_path).to eq('/teams')
    end
  end
end
