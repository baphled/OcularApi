require "spec_helper"

describe OcularApi do

  def app
    OcularApi
  end

  describe "GET /commits" do
    it "is a successful request" do
      get '/commits.json'
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
end
