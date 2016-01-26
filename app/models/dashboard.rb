class Dashboard< ActiveRecord::Base
  belongs_to :line
  has_many :section, dependent: :destroy
  validates_presence_of :name
  after_save :url_assign

  private

  def host
    ENV["BLACK_VULTURE_URL"] || "http://52.32.38.238"
  end

  def url_assign
    self.url = "#{host}/dashboard/#{self.id}"
  end
end
