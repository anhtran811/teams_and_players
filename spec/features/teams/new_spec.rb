require 'rails_helper'

# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed   

RSpec.describe 'Team creation' do
  describe 'As a visitor' do
    describe 'When I visit the Team Index page' do
      it "can see a link 'New team' to create a new Team record" do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player_1 = team.players.create!(name: 'Koke', age: 30, old_enough: true)

        visit '/teams'

        click_link('New Team')

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