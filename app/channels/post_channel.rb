# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "demo"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def echo(data)
    ActionCable.server.broadcast "demo", {servidor: "epaaa"}
  end

end
