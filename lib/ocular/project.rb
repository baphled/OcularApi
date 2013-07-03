require "hpricot"

module Ocular
  class Project
    class << self
      attr_accessor :job_id

      def deploy opts = {}
        deploy_url = "#{Ocular::Config.webistrano_url}/projects/#{opts[:name]}/stages/#{opts[:stage]}/deployments?deployment[task]=deploy:migrations&deployment[description]=Deploy%20from%20Ocular"
        response = make_request(deploy_url)
        response_html = response.body
        doc = Hpricot response_html
        job_url = doc.search("//a[@href]").first.attributes['href']
        job_id = job_url.split("/").last
        {
          job_id: job_id.to_i
        }
      end
      
      def make_request(url)
        url = URI.parse(url)
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Get.new(url.request_uri)
        request.basic_auth("jenkins", "jenkins")
        http.request(request)
      end
    end
  end
end
