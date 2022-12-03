require 'rails_helper'

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

RSpec.describe 'Player Index' do
  describe 'As a visitor' do
    describe 'When I visit /player_table_name' do
      it 'I can see the players attributes' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)

        visit '/player_table_name'

        expect(page).to have_content('Koke')
        expect(page).to have_content(30)
        expect(page).to have_content(true)
      end

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
    
      it 'I can see a link at the top of the page that takes me to the player index' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)
      
        visit "/player_table_name"

        click_link('Player Index')
        expect(current_path).to eq('/player_table_name')
      end
    end
  end
end