include ApplicationHelper

namespace :start do
  desc "setIntervel quantity product"
  task setIntervel: :environment do
    # $redis.del "auctions"
    set_interval(1) do |n|
      auctions =  $redis.get("auctions")

      if auctions.nil?
        auctions = Auction.all.to_json
        $redis.set("auctions", auctions)
        $redis.expire("auctions", 5.hour.to_i)
      end

      @auctions = JSON.load auctions

      auctions = @auctions.select do |e|
       e['timer'] = (e['timer'].to_i + 1)
      end

      $redis.set("auctions", auctions.to_json)

      ActionCable.server.broadcast 'messages',
        list: JSON.load($redis.get("auctions"))
    end
  end
end
