require "octokit"

module Ocular
  class Commits
    attr_accessor :account

    def initialize options = {}
      self.account = Octokit::Client.new(:login => options[:user], :password => options[:password])
    end

    def find
      account.commits("nature/laserwolf")[0...10]
    end
  end
end
