module Ocular
  class Commit
    attr_accessor :author, :message, :date, :sha

    def initialize commit_info
      self.author = commit_info.author.login
      self.message = commit_info.commit.message.gsub("\n", " ")
      self.date = DateTime.parse(commit_info.commit.committer.date).strftime("%H:%M:%S %d %b %Y")
      self.sha = "##{commit_info.sha[0..7]}"
    end
  end
end
