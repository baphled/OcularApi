require "octokit"

module Ocular

  class Commits
    attr_accessor :account

    def initialize options = {}
      self.account = Octokit::Client.new(:login => options[:user], :password => options[:password])
    end

    def find repo
      latest_commit = account.commits(repo).first
      Ocular::Commit.new latest_commit
    end
  end
end
