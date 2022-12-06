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
  end
end