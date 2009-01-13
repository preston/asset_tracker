class CreateLocations < ActiveRecord::Migration

  def self.up
    create_table :locations, :force => true do |t|
      t.string :name, :null => false
      t.timestamps
    end
    # ActiveRecord::Base.connection.execute("INSERT INTO locations(id, name) VALUES(1, 'Default')")
    add_column :assets, :location_id, :integer
    # ActiveRecord::Base.connection.execute("INSERT INTO locations(name) VALUES('Default')")
    # ActiveRecord::Base.connection.execute("UPDATE assets SET location_id = 1")
    # ActiveRecord::Base.connection.execute("ALTER TABLE assets MODIFY(location_id NOT NULL)")
  end

  def self.down
    drop_table :locations
  end
end
