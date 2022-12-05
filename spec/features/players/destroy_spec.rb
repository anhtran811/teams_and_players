require 'rails_helper'

# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

RSpec.describe 'Destroying a player' do
  describe 'As a visitor' do
    describe 'When I visit a player show page' do
      it 'can delete a player' do 
        portugal = Team.create!(name: 'Portugal', rank: 9, qualified: true)
        silva = portugal.players.create!(name: 'Silva', age: 19, old_enough: true)

        visit "/players/#{silva.id}"
        click_button ("Delete: #{silva.name}")

        expect(current_path).to eq('/players')
        expect(page).to_not have_content('Silva')
      end
    end
  end
end