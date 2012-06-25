class  CreatePullups < ActiveRecord::Migration
  def up
    create_table :pullups do |t|
      t.string :user
      t.string :count
      t.text   :note
      t.timestamps
    end
  end

  def down
    drop_table :pullups
  end
end
