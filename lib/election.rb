class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    @races = []
  end 

  def add_race(race)
    @races << race
  end

  def candidates
    @races.flat_map {|race| race.candidates}
  end

  def vote_counts
    vote_counts = {}
    candidate_hashes = candidates.map {|candidate| {candidate.name=> candidate.votes}}
    candidate_hashes.each{|hash| vote_counts.merge!(hash)}
    vote_counts
  end
end  