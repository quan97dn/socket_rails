class Auction < ApplicationRecord
  after_save :clear_cache
  belongs_to :product

  def clear_cache
    $redis.del "auctions"
  end
end
