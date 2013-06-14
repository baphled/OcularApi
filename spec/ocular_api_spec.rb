require "spec_helper"

describe OcularApi do

  def app
    OcularApi
  end

  describe "GET /commits" do
    it "is a successful request" do
      get '/commits'
      last_response.should be_successful
    end

    it "contains a list of commits" do
      get '/commits.json'
      expected = {
        commit: [
          {
            user: 'baphled',
            message: 'A cool new change',
            date: '2013-1-16'
          }
        ]
      }
      last_response.body.should include JSON.generate(expected)
    end
    it "contains the number of commits"
    it "lists pull requests"

    describe "a commit message" do
      it "contains the authors name"
      it "contains the time it was commited"
      it "contains the commit message"
    end

    it "contains the number of commits for the day"
    it "contains commit stats for the past week"

    context "formats" do
      it "HTML requests are preformatted messages"
      it "handles JSON requests"
      it "handles XML requests"
    end
  end
end
