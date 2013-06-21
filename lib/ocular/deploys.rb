require "nokogiri"
require 'net/http'

module Ocular
  class Deploys
    def initialize(opts = {})
      @deploy_url = "#{Ocular::Config.webistrano_url}/projects/#{opts[:name]}/stages/#{opts[:stage]}/deployments/latest.xml"
    end

    def last_deployment
      @deployment ||= fetch_deployment
    end

    def deploy_user(id)
      users_url = "#{Ocular::Config.webistrano_url}/users/#{id}.xml"
      response = make_request(users_url)
      xml = Nokogiri.parse(response.body)
      xml.at('login').text
    end

    private

    def fetch_deployment
      response = make_request(@deploy_url)
      xml = Nokogiri.parse(response.body)
      Ocular::Deployment.new({
        timestamp: xml.at("created-at").text,
        user: deploy_user(xml.at("user-id").text),
        revision: xml.at("revision").text,
        status: xml.at("status").text,
        description: xml.at("description").text,
        finished_at: xml.at("completed-at").text
      })
    end

    def make_request(url)
      url = URI.parse(url)
      http = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Get.new(url.request_uri)
      request.basic_auth(Ocular::Config.ci_user, Ocular::Config.ci_password)
      http.request(request)
    end
  end
end
