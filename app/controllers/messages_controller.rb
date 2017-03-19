class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipient = User.find_by(id: params[:user])
  end

  def create
    recipients = User.find_by(user_name: params["recipients"])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
  
end
