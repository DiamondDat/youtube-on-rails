require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validates' do
    it { should validate_presence_of(:url) }
    it { should allow_value('https://youtu.be/NLOp_6uPccQ').for(:url) }
  end
end
