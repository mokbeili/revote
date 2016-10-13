class VotesController < ApplicationController
  def new
    @vote = Vote.new
    long = Voter.find(session[:voter_id]).longitude
    lat = Voter.find(session[:voter_id]).latitude

    riding_code = JSON.parse(HTTP.get(URI("http://represent.opennorth.ca/boundaries/?contains=#{lat},#{long}")))["objects"][-1]["external_id"]

    session["remaining_systems"] = ["Alternative Vote","Mixed Member Proportional", "Single Non-Transferable Vote", "List Proportional Representation"].shuffle unless session["remaining_systems"]

    if session["remaining_systems"].length == 0
      redirect_to edit_voter_path(Voter.find(session[:voter_id]))
    else
      @sys = session["remaining_systems"].pop
      @candidates = get_candidates(@sys, riding_code)
      @parties = @candidates.where(last_name: 'Party')
      @party_candidates = @candidates.where(last_name: nil)
      @candidates = @candidates.where('last_name IS NOT NULL')
    end
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.voter_id = session[:voter_id]
    @vote.save
    redirect_to new_vote_path
  end

  def av_vote
    Vote.where(voter_id: session[:voter_id]).delete_all
    params[:candidate].each_with_index do |id, index|
      Vote.create(voter_id: session[:voter_id], candidate_id: id, rank: index + 1)
    end
    head :ok
  end

  def get_candidates(sys, code)
    case sys
    when "Alternative Vote"
      riding = Riding.where(electoral_system: "Alternative Vote").find_by_code(code)
      riding.candidates
    when "Mixed Member Proportional"
      Riding.where(electoral_system: 'Mixed Member Proportional').find_by_code(code).candidates
    when 'Single Non-Transferable Vote'
      parent = Riding.where(code: code).first.riding_id
      Riding.find(parent).candidates
    when 'List Proportional Representation'
      riding = Riding.find_by_electoral_system('List Proportional Representation')
      riding.candidates
    end
  end

  def vote_params
    params.require(:vote).permit(:candidate_id, :mmp_party)
  end
end
