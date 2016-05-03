require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  describe 'State machine' do
    before do
      @message = FactoryGirl.create(:message)
    end

    it 'initial state' do
      expect(@message.state).to eql('unread')
    end

    it 'reading a message' do
      expect(@message.state).to eql('unread')
      @message.read
      expect(@message.state).to eql('read')
    end
  end
end
