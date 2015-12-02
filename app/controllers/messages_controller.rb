class MessagesController < ApplicationController
  require 'securerandom'
  
  before_action :set_message, only: [:show, :destroy]

  # GET /messages
  def index
  	@messages = Message.all
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1
  def show
  end

  # POST /messages
  def create
    @message = Message.new(message_params)
    @message.message_id = SecureRandom.uuid;
    @message.authenticated = !@message.password?

    if @message.save
      MessageMailer.sd_message(@message).deliver_now
      redirect_to action: 'index', notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to action: 'index', notice: 'Message was successfully destroyed.'
  end

  private
  	# Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :recipient, :password)
    end
end
