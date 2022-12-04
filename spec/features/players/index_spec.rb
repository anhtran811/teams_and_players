require 'rails_helper'

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

RSpec.describe 'Player Index' do
  describe 'As a visitor' do
    describe 'When I visit /players' do
      it 'I can see the players attributes' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)

        visit '/players'

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
      
        visit '/players'

        click_link('Player Index')

        expect(current_path).to eq('/players')
      end

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
      it 'I can see a link at the top of the page that takes me to the teams index' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)
      
        visit '/players'

        click_link('Teams Index')

        expect(current_path).to eq('/teams')
      end
    end
  end
end