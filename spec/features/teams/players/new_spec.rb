require 'rails_helper'

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe 'Player creation' do
  describe 'As a visitor' do
    describe 'When I visit a Team Player Index page' do
      it "then I see a link called 'Create Player' to add a new adopable player for that team called" do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
  
        visit "/teams/#{spain.id}/players"

        click_link("Create Player for #{spain.name}")

        expect(current_path).to eq("/teams/#{spain.id}/players/new")
      end

      it 'can create a new player' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        # pedri = spain.players.create!(name: 'Pedri', age: 26, old_enough: true)

        visit "/teams/#{team.id}/players/new"

        fill_in('Name', with: 'Pedri')
        fill_in('Age', with: '26')
        fill_in('Old enough', with: 'true')
       
        click_button('Create Player')
    
        expect(current_path).to eq("/teams/#{team.id}/players")
        expect(page).to have_content('Pedri')
        expect(page).to have_content('26')
        expect(page).to have_content('true')
      end
    end
  end
end