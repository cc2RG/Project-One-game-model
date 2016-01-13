class CreateXoxes < ActiveRecord::Migration
  def change
    create_table :xoxes do |t|
      t.integer  "match_id"
      t.string   "gamestate"
      t.integer  "moves",         default: [],              array: true
      t.string   "winner"
      t.timestamps null: false
    end
  end
end
