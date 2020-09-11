class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.integer :followed_user
      t.integer :follower
    end

    add_foreign_key: :followers, :users, column: :followed_user
    add_foreign_key: :followers, :users, column: :follower
  end
end
