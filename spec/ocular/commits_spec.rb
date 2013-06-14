require "spec_helper"

describe Ocular::Commits do
  it "authenticates with a user" do
    Octokit::Client.should_receive(:new).with(:login => "me", :password => "sekret")
    Ocular::Commits.new user: 'me', password: 'sekret'
  end

  describe "#commits" do
    let(:commits) { Ocular::Commits.new user: 'baphled', password: 'Sh1zzl323' }

    it "returns the last 10 commits" do
      commits.find.size.should eql 10
    end

    describe "a commit" do
      it "has am author"
      it "has a date"
      it "has a message"
    end
  end
end
