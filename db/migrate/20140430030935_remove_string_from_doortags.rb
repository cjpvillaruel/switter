class RemoveStringFromDoortags < ActiveRecord::Migration
  def change
    remove_column :doortags, :string, :string
  end
end
