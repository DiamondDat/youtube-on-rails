class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string   :uid, null: false, default: ""
      t.string   :url, null: false, default: ""

      t.string   :title
      t.text     :description

      t.integer  :like_count, default: 0
      t.integer  :dislike_count, default: 0

      t.datetime :published_at

      t.timestamps
    end

    add_index :videos, :uid, unique: true
  end
end
