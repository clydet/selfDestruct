class RecipientsController < ApplicationController
  
  before_action :set_message

  # GET /recipients/1
  def show
    if @message.authenticated?
      @message.delete()
    else
      redirect_to action: 'authenticate'
    end
  end

  # GET /recipients/1/authenticate
  def authenticate
  end

  # POST /recipients/1
  def authenticatedShow
    paramHash = message_params
    if @message.password == paramHash[:password] && @message.update(authenticated: true)
      redirect_to action: 'show'
    else
      redirect_to action: 'authenticate'
    end
  end

  private
  	# Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find_by message_id: params[:id]
      if !@message
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:password)
    end
end
