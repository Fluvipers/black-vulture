require 'rails_helper'

RSpec.describe Section , type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :query}
end
