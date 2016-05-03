class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy, :archive]

  respond_to :html, :json

  def index
    @messages = Message.not_archived
    respond_with(@messages)
  end

  def show
    @message.read if @message.unread?
    respond_with(@message)
  end

  def new
    @message = Message.new
    respond_with(@message)
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.save
    respond_with(@message)
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  def archive
    @message.archive
    respond_with(@message, location: messages_path)
  end

  def archive_all
    @messages = Message.not_archived.each { |message| message.archive }
    respond_with(@messages, location: messages_path)
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :content)
  end
end
