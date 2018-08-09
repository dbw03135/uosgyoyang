class RoomsController < ApplicationController
  def show
    if Message.first
      @messages = Message.last(100)
    else
      @messages = Message.all
    end
  end
end
