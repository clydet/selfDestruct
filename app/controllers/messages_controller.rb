class MessagesController < ApplicationController
  require 'securerandom'

  #before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_message, only: [:show, :destroy]

  # GET /messages
  def index
  	puts '@messages', @messages
  	@messages = Message.all
  	puts '@messages', @messages
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

    respond_to do |format|
      if @message.save
        format.html { redirect_to action: 'index', notice: 'Message was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to action: 'index', notice: 'Message was successfully destroyed.' }
    end
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
