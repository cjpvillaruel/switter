class CreateDoortags < ActiveRecord::Migration
  def change
    create_table :doortags do |t|
      t.string :tag
      t.string :string
      t.integer :swit_id

      t.timestamps
    end
  end
end
