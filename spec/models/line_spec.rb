require 'rails_helper'

RSpec.describe Line, type: :model do
  it { should validate_presence_of :name }
end
