class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  def self.ordered
    all.order('created_at desc')
  end

  def player_count
    players.count
  end

  def alphabetical
    players.order(:name)
  end

  def min_age(age)
    players.where("age >= #{age}")
  end
end