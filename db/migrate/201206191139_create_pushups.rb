class  CreatePushups < ActiveRecord::Migration
  def up
    create_table :pushups do |t|
      t.string :user
      t.string :count
      t.text   :note
      t.timestamps
    end
  end

  def down
    drop_table :pushups
  end
end
