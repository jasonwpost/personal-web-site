class MessagesController < ApplicationController

  def contact
  	@message = Message.new
  end

  def create
  	@message = Message.new(message_params)
    captcha_message = "Big Error!"
  	if verify_recaptcha(recaptcha_response: "There was a mistake in your captcha" ) && @message.valid?
      MessageMailer.message_me(@message).deliver_now
      redirect_to contact_path
      flash[:success] = "Message sent"
    elsif !verify_recaptcha
      flash[:error] = "Something went wrong with the captcha. Are you human?"
    else
      flash[:error] = "You must be missing information"
  	end
  end

  private

  def message_params
  	params.require(:message).permit(:name, :email, :subject, :content)
  end
end
