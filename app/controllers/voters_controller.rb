class VotersController < ApplicationController

  def new
    @voter = Voter.new
  end

  def create
    @voter = Voter.new(voter_params)
    @voter.save
    session[:voter_id] = @voter.id
    redirect_to new_vote_path
  end

  def edit
    @voter = Voter.find(session[:voter_id])
  end

  def update
    find_voter
    @voter.update(voter_params)
    redirect_to goodbye_path
  end

  private

  def voter_params
    params.require(:voter).permit(:unit, :street, :street_name, :city, :province, :postal_code)
  end

  def find_voter
    @voter = Voter.find params[:id]
  end
end
