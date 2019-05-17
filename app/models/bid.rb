class Bid < ApplicationRecord
  belongs_to :vacation
  belongs_to :bidder
end
