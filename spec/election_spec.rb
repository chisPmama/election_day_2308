require 'rspec'
require 'pry'
require './lib/candidate'
require './lib/race'
require './lib/election'

describe Election do
  before(:each) do
    @gov_race = Race.new("Texas Governor")  
    @candidate1 = @gov_race.register_candidate!({name: "Diana D", party: :democrat})
    @candidate2 = @gov_race.register_candidate!({name: "Roberto R", party: :republican})
    @election = Election.new("2012")
  end

  it 'can exist' do
    expect(@election.year).to eq("2012")
    expect(@election.races).to eq([])
  end

  it 'can add a race into the election' do
    @election.add_race(@gov_race)
    expect(@election.races.class).to eq(Array)
    expect(@election.races).to eq([@gov_race])
  end

  it 'can return an array of all Candidates in the election' do
    @election.add_race(@gov_race)
    expect(@election.candidates.class).to eq(Array)
    expect(@election.candidates).to eq([@candidate1,@candidate2])
  end

  it 'can return how many votes are per each name' do
    @election.add_race(@gov_race)
    expect(@election.vote_counts.class).to eq(Hash)
    expect(@election.vote_counts).to eq({"Diana D"=>0,"Roberto R"=>0})
  end
end