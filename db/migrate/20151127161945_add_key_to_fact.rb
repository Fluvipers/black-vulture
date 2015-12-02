class AddKeyToFact < ActiveRecord::Migration
  def up
    add_column :facts, :key, :string
  end
    
  def down
    remove_column :facts, :key
  end
end
