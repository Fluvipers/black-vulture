class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.references :line, index: true, foreign_key: true
      t.jsonb :properties
      t.references :time_unit, index: true, foreign_key: true
      t.decimal :value, precision: 20, scale: 4 

      t.timestamps null: false
    end
  end
end
