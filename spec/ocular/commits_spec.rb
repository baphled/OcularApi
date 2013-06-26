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

    describe "a commit" do
      it "has am author" do
        commits.find(repository).author.should eql 'baphled'
      end

      it "has a message" do
        expected = 
        "Bump version and fix issues with gemspec"
        commits.find(repository).message.should eql expected
      end

      it "strips extra spaces"
      it "has a date" do
        expected = "21:15:12 05 Feb 2013"
        commits.find(repository).date.should eql expected
      end
    end
  end
end
