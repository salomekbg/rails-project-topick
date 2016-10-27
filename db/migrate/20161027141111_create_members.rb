class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
