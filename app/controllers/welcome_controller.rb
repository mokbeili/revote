class WelcomeController < ApplicationController

  def index
    if session["remaining_systems"] && session["remaining_systems"].length == 0
      @message = "It appears that you have already completed our electoral simulation, You may continue where you left off or restart?"
    else
    end
    render :index
  end

  def goodbye
  end
end
