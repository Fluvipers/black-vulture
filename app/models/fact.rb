class Fact < ActiveRecord::Base
  belongs_to :line
  belongs_to :time_unit
end
