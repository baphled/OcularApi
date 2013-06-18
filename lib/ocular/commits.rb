require "octokit"

module Ocular

  class Commits
    attr_accessor :account

    def initialize options = {}
      self.account = Octokit::Client.new(:login => options[:user], :password => options[:password])
    end

    def find repo
      total_commits = account.commits(repo)
      total_commits[0...5].collect do |info|
        Ocular::Commit.new info
      end
    end
  end
end
