class MessagesController < ApplicationController
  #before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_message, only: [:show]

  def index
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

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
  	# Use callbacks to share common setup or constraints between actions.
    def set_message
      puts 'here i am'
      @message = Message.find(params[:id])
      puts 'message', @message.inspect
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      puts params
      params.require(:message).permit(:content, :recipient, :password)
    end
end
