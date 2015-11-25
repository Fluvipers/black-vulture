class CreateTimeUnits < ActiveRecord::Migration
  def change
    create_table :time_units do |t|
      t.datetime :when
      t.string :year
      t.string :semester
      t.string :quarter
      t.string :bimester
      t.string :month
      t.string :month_of_year
      t.string :fortnight
      t.string :week_of_year
      t.string :week_of_month
      t.string :day
      t.string :day_of_week
      t.string :day_of_month
      t.string :day_of_year
      t.string :noon
      t.string :hour
      t.string :minute
      t.string :time_zone

      t.timestamps null: false
    end
  end
end
