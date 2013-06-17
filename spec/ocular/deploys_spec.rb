require "spec_helper"
require "nokogiri"

describe Ocular::Deploys do
  describe "#deploy" do
      let(:deploys) { Ocular::Deploys.new name: Ocular::Config.deploy_project, stage: Ocular::Config.deploy_stage}
      let(:latest) { File.read('spec/fixtures/latest.xml') }
      let(:user) { File.read('spec/fixtures/user.xml') }
      let(:response) { stub(:body => latest) }
      let(:user_response) { stub(:body => user) }

      before :each do
        deploys.stub(:make_request).with("#{Ocular::Config.webistrano_url}/projects/some-project/stages/staging/deployments/latest.xml").and_return response
        deploys.stub(:make_request).with("#{Ocular::Config.webistrano_url}/users/15.xml").and_return user_response
      end

    it "gets the latest deployment" do
      deploys.last_deployment.should be_an Ocular::Deployment
    end

    it "returns the status" do
      deploys.last_deployment.status.should eql 'success'
    end

    it "returns who deployed the application" do
      deploys.last_deployment.user.should eql 'jenkins'
    end

    it "returns the revision" do
      deploys.last_deployment.revision.should eql 'foo'
    end

    it "returns when the job was created" do
      deploys.last_deployment.date.should eql '2013-06-17T11:24:07Z'
    end

    it "returns when it was complete" do
      deploys.last_deployment.finished_at.should eql '2013-06-17T11:24:43Z'
    end
  end
end
