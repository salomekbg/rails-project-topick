class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :member_id
      t.string :content

      t.timestamps
    end
  end
end
