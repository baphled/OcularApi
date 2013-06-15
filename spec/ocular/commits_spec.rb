require "spec_helper"

describe Ocular::Commits do
  it "authenticates with a user" do
    Octokit::Client.should_receive(:new).with(:login => "me", :password => "sekret")
    Ocular::Commits.new user: 'me', password: 'sekret'
  end

  describe "#find" do
    let(:user) { Ocular::Config.login }
    let(:password) { Ocular::Config.password }
    let(:repository) { Ocular::Config.repository }
    let(:commits) { Ocular::Commits.new user: user, password: password}

    it "returns the last 5 commits" do
      commits.find(repository).size.should eql 5
    end

    describe "a commit" do
      it "has am author" do
        commits.find(repository).first[:author].should eql 'baphled'
      end

      it "has a message" do
        expected = 
        "Bump version and fix issues with gemspec"
        commits.find(repository).first[:message].should eql expected
      end

      it "has a date" do
        expected = "2013-02-05T21:15:12Z"
        commits.find(repository).first[:date].should eql expected
      end
    end
  end
end
