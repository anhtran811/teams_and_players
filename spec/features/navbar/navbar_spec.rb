require 'rails_helper'

RSpec.describe 'Navbar' do
  describe 'As a visitor' do
    describe 'When I visit any teams page' do
      it 'can see link at the top of the page that takes me to the teams index' do
        visit '/teams'
        click_link('Teams Index')

        expect(current_path).to eq('/teams')
        
        visit '/players'
        click_link('Teams Index')

        expect(current_path).to eq('/teams')
      end
    end

    describe 'When I visit any players page' do
      it 'can see a link at the top of the page that takes me to the players index' do
        visit '/teams'
        click_link('Player Index')

        expect(current_path).to eq('/players')
        
        visit '/players'
        click_link('Player Index')

        expect(current_path).to eq('/players')
      end
    end
  end
end