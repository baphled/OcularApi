require "spec_helper"

describe Ocular::Project do
  describe "#deploy" do
    it "makes a request to deploy the project" do
      expect {
        Ocular::Project.deploy
      }.to_not raise_error Exception
    end
    it "returns information about the new job"
  end
end

