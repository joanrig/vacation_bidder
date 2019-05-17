class Bidder < ApplicationRecord
  has_many :bids
  has_many :vacations, through: :bids
end
