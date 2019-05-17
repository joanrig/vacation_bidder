class Bid < ApplicationRecord
  belongs_to :vacation
  belongs_to :bidder
  validates :amount, presence: true
  validates :bidder_id, presence: true
  validates :vacation_id, presence: true
  validates :link, presence: true
end
