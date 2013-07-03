require "spec_helper"

describe OcularApi do

  def app
    OcularApi
  end

  describe "GET /commit/last.txt" do
    it "is a successful request" do
      get '/commit/last.txt'
      last_response.should be_successful
    end

    it "lists pull requests"

    it "contains the number of commits for the day"
    it "contains commit stats for the past week"

    context "formats" do
      it "HTML requests are preformatted messages"
      it "handles JSON requests"
      it "handles XML requests"
    end
  end

  describe "GET /deploy" do
    it "returns the deploy job number" do
      deploy_stub = { :job_id => 1234 }
      Ocular::Project.stub(:deploy).and_return deploy_stub
      get '/deploy'
      JSON.parse(last_response.body).should eql "job_id" => 1234
    end
  end

  describe "GET /deploy/status/:job_id" do
    it "takes a job number"
    it "returns 404 if job not found"
    it "returns the current status of the deployment"

    context "job complete" do
      it "returns completion information"
      it "returns the job status"
    end
  end
end
