module Ocular
  class Commit
    attr_accessor :author, :message, :date

    def initialize commit_info
      self.author = commit_info.author.login
      self.message = commit_info.commit.message.delete("\n")
      self.date = DateTime.parse(commit_info.commit.committer.date).strftime("%H:%M:%S %d %b %Y")
    end
  end
end
