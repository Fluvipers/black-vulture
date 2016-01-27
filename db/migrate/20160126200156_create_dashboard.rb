class CreateDashboard < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.string :name
      t.string :url
      t.references :line, index: true, foreign_key: true
    end
  end
end
