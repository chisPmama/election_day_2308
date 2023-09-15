class Candidate

  attr_reader :name, :party, :votes

  def initialize(hash)
    @name = hash[:name]
    @party = hash[:party]
    @votes = 0
  end

  def vote_for!
    @votes +=1
  end

end