class WelcomeController < ApplicationController

  def index
    if session["remaining_systems"] && session["remaining_systems"].length == 0
      @message = "It appears that you have already completed our electoral simulation, would you like to redo?"
    else
    end
    render :index
  end

  def goodbye
  end
end
