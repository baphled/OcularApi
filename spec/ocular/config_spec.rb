require "spec_helper"

describe Ocular::Config do
  Ocular::Config.config do |c|
    c.login = 'foo'
    c.password = 'password'
    c.repository = 'foo/repo'
  end
  describe "#config" do
    it "stores a login" do
      Ocular::Config.login.should eql 'foo'
    end
    it "stores a password" do
      Ocular::Config.password.should eql 'password'
    end
    it "stores a repository" do
      Ocular::Config.repository.should eql 'foo/repo'
    end
  end
end
