class Line < ActiveRecord::Base
  has_many :facts, dependent: :destroy
  has_many :dashboards, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false, message: "There is already a line with that name"}
end
