class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :line, index: true, foreign_key: true
      t.string :name
      t.string :query

      t.timestamps null: false
    end
  end
end
