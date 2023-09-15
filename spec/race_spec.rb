require 'rspec'
require 'pry'
require './lib/candidate'
require './lib/race'

describe Race do
  before(:each) do
    @race = Race.new("Texas Governor")  
  end

  it 'can exist' do
    expect(@race).to be_a(Race)
    expect(@race.office).to eq("Texas Governor")
    expect(@race.candidates).to eq([])
  end

  it 'can register the candidate to the race' do
    candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
    expect(@race.candidates.count).to eq(2)
  end

  it 'can register a second candidate to the race' do
    candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
    expect(candidate2.class).to eq(Candidate)
    expect(candidate2.name).to eq("Roberto R")
    expect(candidate2.party).to eq(:republican)
  end

  it 'has an open value of race when creating on default' do
    expect(@race.open?).to eq(true)
  end

  it 'can close a race upon method' do
    @race.close!
    expect(@race.open?).to eq(false)
  end

  it 'returns false if the race is still open when returning winner' do
    expect(@race.winner).to eq('false')
  end

  it 'can return the winner if the race is no longer open' do
    candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
    candidate2.vote_for!
    @race.close!
    expect(@race.winner).to eq("Roberto R")
    expect(@race.open?).to eq(false)
    candidate1.vote_for!
    # expect(@race.winner).to eq("Roberto R")
  end

  it 'will return a boolean if there is a tie' do
    candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
    candidate2.vote_for!
    candidate1.vote_for!
    expecet(@race.tie?).to eq(true)
  end
end