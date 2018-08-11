class CreateAuction < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.references :product, foreign_key: true
      t.string :timer, nil: false
      t.integer :status, default: 1
    end
  end
end
