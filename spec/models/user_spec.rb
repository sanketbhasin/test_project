require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do
    let(:user) { build(:user, email: '') }
    let(:user1) { build(:user, name: '') }
    let(:user2) { build(:user, user_type: '') }
    let(:user3) { build(:user) }
    it 'ensures email presence' do
      expect(user.save).to eq(false)
    end

    it 'ensures name presence' do
      expect(user1.save).to eq(false)
    end

    it 'ensures user_type presence' do
      expect(user2.save).to eq(false)
    end

    it 'ensures email presence' do
      byebug
      expect(user3.save).to eq(true)
    end
  end
end

