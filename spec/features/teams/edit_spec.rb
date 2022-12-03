require 'rails_helper'

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

RSpec.describe 'Edit team' do
  describe 'As a visitor' do
    describe 'When I visit a Team show page' do
      it "can see a link called 'update team' to edit the team" do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = team.players.create!(name: 'Koke', age: 30, old_enough: true)

        visit "/teams/#{team.id}"

        click_link ("Edit Team: #{team.name}")

        expect(current_path).to eq("/teams/#{team.id}/edit")
      end

      it 'can edit the Team' do
        team = Team.create!(name: 'Spaine', rank: 10, qualified: false)

        visit "/teams/#{team.id}/edit"

        fill_in('Name', with: 'Spain')
        fill_in('Rank', with: '7')
        fill_in('Qualified', with: 'true')
        click_button 'Update Team'
        
        expect(current_path).to eq("/teams/#{team.id}")
        expect(page).to have_content('Spain')
      end
    end
  end
end