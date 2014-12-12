class CreateDatafixTables < ActiveRecord::Migration
  def self.up
    create_table :datafix_logs do |t|
      t.string :direction
      t.string :script
      t.timestamp :timestamp
    end

    create_table :datafix_statuses do |t|
      t.string :script
      t.string :direction
      t.timestamps null: false
    end

    add_index :datafix_statuses, :script, unique: true
  end

  def self.down
    drop_table :datafix_logs
    drop_table :datafix_statuses
  end
end

