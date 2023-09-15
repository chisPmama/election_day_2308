require 'rspec'
require 'pry'
require './lib/candidate'

describe Candidate do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  it 'can exist' do
    expect(@diana).to be_a(Candidate)
    expect(@diana.name).to eq("Diana D")
    expect(@diana.party).to eq(:democrat)
  end

  it 'begins with Diana having no votes' do
    expect(@diana.votes).to eq(0)
  end

  it 'has a method that creates votes per candidate and votes stored to count' do
    @diana.vote_for!
    @diana.vote_for!
    @diana.vote_for!
    expect(@diana.votes).to eq(3)
    @diana.vote_for!
    expect(@diana.votes).to eq(4)
  end

end