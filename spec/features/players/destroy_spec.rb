require 'rails_helper'

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

    describe 'When I visit a players index page' do
      it 'can delete a player' do
        portugal = Team.create!(name: 'Portugal', rank: 9, qualified: true)
        silva = portugal.players.create!(name: 'Silva', age: 19, old_enough: true)

        visit '/players'
        click_button("Delete: #{silva.name}")

        expect(current_path).to eq('/players')
        expect(page).to_not have_content('Silva')
      end
    end
  end
end