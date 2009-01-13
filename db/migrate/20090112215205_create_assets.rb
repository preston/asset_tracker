class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :model_id, :null => false
      t.integer :user_id, :null => false
      t.string  :serial
      t.text    :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
