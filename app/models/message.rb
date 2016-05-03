class Message < ActiveRecord::Base

  validates :title, presence: true
  validates :content, presence: true

  state_machine :state, initial: :unread do

    event :read do
      transition unread: :read
    end

  end

end
