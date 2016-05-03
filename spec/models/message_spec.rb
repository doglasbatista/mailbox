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

    it 'mark read_at with current date when user read a message' do
      @message.read
      expect(@message.read_at).not_to be_nil
    end
  end
end
