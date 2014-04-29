class CreateSweets < ActiveRecord::Migration
  def change
    create_table :sweets do |t|
      t.string :user_id
      t.integer :swit_id

      t.timestamps
    end
  end
end
