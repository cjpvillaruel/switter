class AddUserToSwits < ActiveRecord::Migration
  def change
    add_column :swits, :user_id, :string
  end
end
