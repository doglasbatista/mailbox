class Message < ActiveRecord::Base

  validates :title, presence: true
  validates :content, presence: true

  state_machine :state, initial: :unread do

    event :read do
      transition unread: :read
    end

    event :archive do
      transition any => :archived
    end

    after_transition to: :read do |message|
      message.read_at = Time.current
    end

    after_transition any => :archived do |message|
      message.archived_at = Time.current
    end

  end

end
