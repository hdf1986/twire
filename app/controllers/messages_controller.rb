# frozen_string_literal: true

class MessagesController < SignedInApplicationController
  def index
    @messages = Message.where(user: current_user.followed.ids + [current_user.id])
                       .includes(:user)
                       .order(created_at: :desc)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(permitted_params)
    @message.user = current_user

    if @message.save
      respond_to do |format|
        format.html { redirect_to messages_path }
        format.turbo_stream
      end
    else
      render 'messages/new'
    end
  end

  private

  def permitted_params
    params.require(:message).permit(:content)
  end
end
