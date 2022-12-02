require 'rails_helper'

RSpec.describe Team, type: :model do
  it {should have_many :players}

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

  describe '#ordered teams in index' do
    it 'can order the teams by most recently created' do
      team_1 = Team.create!(name: 'Spain', rank: 7, qualified: true, created_at: DateTime.now - 5.days)
      team_2 = Team.create!(name: 'Canada', rank: 40, qualified: true, created_at: DateTime.now)
      team_3 = Team.create!(name: 'England', rank: 5, qualified: true, created_at: DateTime.now - 3.days)

      expect(Team.ordered).to eq([team_2, team_3, team_1])
    end
  end
end 