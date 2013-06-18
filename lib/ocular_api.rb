require 'json'
require 'sinatra'
require 'sinatra/base'

class OcularApi < Sinatra::Base

  get '/deploys.txt' do
    deploy = Ocular::Deploys.new name: Ocular::Config.deploy_project, stage: Ocular::Config.deploy_stage
    last_deployment = deploy.last_deployment
    "Revision ##{last_deployment.short_revision} of #{Ocular::Config.deploy_project} was #{last_deployment.status} deployed to #{Ocular::Config.deploy_stage} by
    #{last_deployment.user} on #{last_deployment.date} and finished at #{last_deployment.finished_at}".capitalize
  end

  get '/commits.json' do
    commits = Ocular::Commits.new user: Ocular::Config.login, password: Ocular::Config.password
    response = {
      commit: commits.find( Ocular::Config.repository )
    }
    JSON.generate response
  end

  get '/commits.txt' do
    commits = Ocular::Commits.new user: Ocular::Config.login, password: Ocular::Config.password
    commits.find(Ocular::Config.repository).collect do |commit|
      "#{commit.author}: #{commit.message} at #{commit.date}"
    end.join ' ... '
  end

  get '/errors' do
    "Errors information will live here eventually"
  end
end
