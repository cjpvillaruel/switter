class CreateSwits < ActiveRecord::Migration
  def change
    create_table :swits do |t|
      t.text :post

      t.timestamps
    end
  end
end
