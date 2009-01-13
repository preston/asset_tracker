class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :null => false
      t.string :email, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
