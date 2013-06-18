module Ocular
  class Commit

    attr_accessor :author, :message, :date

    def initialize commit_info
      self.author = commit_info.author.login
      self.message = commit_info.commit.message
      self.date = commit_info.commit.committer.date
    end
  end
end
