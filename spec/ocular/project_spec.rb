require "spec_helper"

describe Ocular::Project do
  describe "#deploy" do
    before :each do
      response = '<html><body>You are being <a href="http://deploy.npgsrv.com/projects/laserwolf/stages/test-digifps/deployments/18786">redirected</a>.</body></html>'
      stub_request(:get, "http://jenkins:jenkins@deploy.npgsrv.com/projects/laserwolf/stages/test-digifps/deployments?deployment%5Bdescription%5D=Deploy%20from%20Ocular&deployment%5Btask%5D=deploy:migrations").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => response, :headers => {})
    end

    it "makes a request to deploy the project" do
      expect {
        Ocular::Project.deploy
      }.to_not raise_error Exception
    end

    it "returns information about the new job" do
      Ocular::Project.deploy.should eql job_id: 18786
    end
  end
end
