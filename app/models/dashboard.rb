class Dashboard< ActiveRecord::Base
  belongs_to :line
  has_many :section, dependent: :destroy
  validates_presence_of :name, :url
end
