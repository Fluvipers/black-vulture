class Section < ActiveRecord::Base
  belongs_to :dashboard
  validates_presence_of :query, :name
end
