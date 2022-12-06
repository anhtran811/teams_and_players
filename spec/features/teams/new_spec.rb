require 'rails_helper'

RSpec.describe 'Team creation' do
  describe 'As a visitor' do
    describe 'When I visit the Team Index page' do
      it "can see a link 'New team' to create a new Team record" do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player_1 = team.players.create!(name: 'Koke', age: 30, old_enough: true)

        visit '/teams'

        click_link('Create a new Team')

        expect(current_path).to eq('/teams/new')
      end

      it 'can create a new team' do
        visit '/teams/new'

        fill_in('Name', with: 'Spain')
        fill_in('Rank', with: '7')
        fill_in('Qualified', with: 'true')
        
        click_button('Create Team')
        
        expect(current_path).to eq('/teams')
        expect(page).to have_content('Spain')
      end
    end
  end
end