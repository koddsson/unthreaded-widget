class Message < ApplicationRecord
  include Turbo::Broadcastable

  validates :body, presence: true

  after_create_commit -> {
    broadcast_prepend_to(
      :messages,
      partial: "messages/message",
    )
    # broadcast_update_to(:messages, target: "messages", html: "<p> 100 </p>")
  }
end
