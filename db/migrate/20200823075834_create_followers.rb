class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.integer :followed_user
      t.integer :follower
      t.timestamps
    end
  end
end
