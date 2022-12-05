require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe 'Team Index' do
  describe 'As a visitor' do
      describe 'When I visit /teams,' do
        it 'I can see the name of each team' do
          team_1 = Team.create!(name: 'Spain', rank: 7, qualified: true)
          team_2 = Team.create!(name: 'Canada', rank: 40, qualified: true)

          visit '/teams'

          expect(current_path).to eq('/teams')
          expect(page).to have_content(team_1.name)
          expect(page).to have_content(team_2.name)
      end

# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
        it 'can see that teams are ordered by most recently created first, along with the date of creation' do
          team_1 = Team.create!(name: 'Spain', rank: 7, qualified: true)
          team_2 = Team.create!(name: 'Canada', rank: 40, qualified: true)
          team_3 = Team.create!(name: 'England', rank: 5, qualified: true)

          visit '/teams'

          expect(page).to have_content(team_1.name)
          expect(page).to have_content(team_1.created_at)
          expect(page).to have_content(team_2.name)
          expect(page).to have_content(team_2.created_at)
          expect(page).to have_content(team_3.name)
          expect(page).to have_content(team_3.created_at)
      end

      it 'I can see a link at the top of the page that takes me to the player index' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player_1 = team.players.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)
  
        visit '/teams'
  
        click_link('Player Index')

        expect(current_path).to eq('/players')
      end

# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
      it 'I can see a link at the top of the page that takes me to the teams index' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player_1 = team.players.create!(name: 'Koke', age: 30, old_enough: true)

        visit '/teams'

        click_link('Teams Index')

        expect(current_path).to eq('/teams')
      end

# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to edit that parent's info
# When I click the link
# I should be taken to that parent's edit page where I can update its information just like in User Story 12
      it 'can see a link next to every team to edit the team' do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        visit '/teams'

        click_link("Edit #{spain.name}")
        expect(current_path).to eq("/teams/#{spain.id}/edit")
        
        england = Team.create!(name: 'England', rank: 5, qualified: true)
        visit '/teams'
        click_link("Edit #{england.name}")
        expect(current_path).to eq("/teams/#{england.id}/edit")
      end
    end
  end
end