class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :models do |t|
      t.string :name, :null => false
      t.integer :kind_id, :null => false
      t.integer :manufacturer_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :models
  end
end
