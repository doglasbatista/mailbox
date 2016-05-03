class Message < ActiveRecord::Base

  validates :title, presence: true
  validates :content, presence: true

  state_machine :state, initial: :unread do

    event :read do
      transition unread: :read
    end

    after_transition to: :read do |message|
      message.read_at = Time.current
    end

  end

end
