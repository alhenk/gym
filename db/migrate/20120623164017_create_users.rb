class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :pullups
      t.integer :pushups
      t.integer :situps
      t.integer :squats
      t.integer :dips
      t.timestamps
    end
  end
end
