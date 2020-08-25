class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :author
      t.text :comment
      t.timestamps
    end
  end
end