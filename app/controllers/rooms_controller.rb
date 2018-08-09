class RoomsController < ApplicationController
  def show
    redirect_to "http://uosgy.herokuapp.com/chat"
    if Message.first
      @messages = Message.last(100)
    else
      @messages = Message.all
    end
  end
end
