class Race

  attr_reader :office, :candidates, :open

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(hash)
    new_candidate = Candidate.new(hash)
    @candidates << new_candidate
    new_candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    vote_counts = {}
    candidate_hashes = @candidates.map {|candidate| {candidate.name=> candidate.votes}}
    candidate_hashes.each{|hash| vote_counts.merge!(hash)}
    winner = vote_counts.sort_by{|key,value| -value}
    return false if close!
     if !tie?
       winner.first.first + " wins!"
     else
       highest_vote = @candidates.map{|candidate| candidate.votes}.sort.reverse
       highest_vote = highest_vote.first
       tied_names = tied_candidates.map{|candidate| candidate.name}
      tied_names.join(" and ") + "tied with #{highest_vote[0]} votes!"
     end
  end

  def tie?
    true if tied_candidates.count > 1
  end

  def tied_candidates
    vote_sort = @candidates.map{|candidate| candidate.votes}.sort.reverse
    tied_candidates = @candidates.find_all{|candidate| candidate.votes == vote_sort[0]}
  end
end
