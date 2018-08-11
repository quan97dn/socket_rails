class AuctionsController < ApplicationController
  include ApplicationHelper
  def index
    @auctions = $redis.get("auctions")
  end

  def new
    @auction = Auction.new
  end

  def create
    auction = Auction.new(message_params)
    auction.save
  end
end
