class Product < ApplicationRecord
  has_many :auctions, dependent: :destroy
end
