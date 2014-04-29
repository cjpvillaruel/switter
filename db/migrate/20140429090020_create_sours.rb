class CreateSours < ActiveRecord::Migration
  def change
    create_table :sours do |t|
      t.string :user_id
      t.string :string
      t.integer :swit_id

      t.timestamps
    end
  end
end
