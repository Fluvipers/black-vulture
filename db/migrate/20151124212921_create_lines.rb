class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :name
      t.jsonb :properties

      t.timestamps null: false
    end
  end
end
