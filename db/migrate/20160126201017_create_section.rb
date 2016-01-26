class CreateSection < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :query
      t.references :dashboard, index: true, foreign_key: true
    end
  end
end
