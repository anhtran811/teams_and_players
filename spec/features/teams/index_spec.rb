require 'rails_helper'

RSpec.describe 'Team Index' do
  describe 'As a visitor' do
      describe 'When I visit a teams index page,' do
        it 'I can see the name of each team' do
          team_1 = Team.create!(name: 'Spain', rank: 7, qualified: true)
          team_2 = Team.create!(name: 'Canada', rank: 40, qualified: true)

          visit '/teams'

          expect(current_path).to eq('/teams')
          expect(page).to have_content(team_1.name)
          expect(page).to have_content(team_2.name)
      end

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