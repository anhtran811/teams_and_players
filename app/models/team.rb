class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  def self.ordered
    self.all.order('created_at desc')
    #self is Team
  end

  def player_count
    players.count
  end
end