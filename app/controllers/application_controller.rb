class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def send_message
    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: turbo_stream.append(:messages, partial: "messages/message", locals: { message: message })
      }
    end
  end
end
