require 'json'
require 'sinatra'
require 'sinatra/base'

class OcularApi < Sinatra::Base

  get '/deploy/last.txt' do
    deploy = Ocular::Deploys.new name: Ocular::Config.deploy_project, stage: Ocular::Config.deploy_stage
    last_deployment = deploy.last_deployment
    "Revision ##{last_deployment.short_revision} of #{Ocular::Config.deploy_project} was #{last_deployment.status} deployed to #{Ocular::Config.deploy_stage} by #{last_deployment.user} on #{last_deployment.date} and finished at #{last_deployment.finished_at}".capitalize
  end

  get '/commit/last.json' do
    commits = Ocular::Commits.new user: Ocular::Config.login, password: Ocular::Config.password
    response = {
      commit: commits.find( Ocular::Config.repository )
    }
    JSON.generate response
  end

  get '/commit/last.txt' do
    latest_commit = Ocular::Commits.new user: Ocular::Config.login, password: Ocular::Config.password
    commit = latest_commit.find(Ocular::Config.repository)
    "#{commit.sha}: #{commit.message} at #{commit.date} by #{commit.author}"
  end

  get '/errors.txt' do
    "Error rate: 0.84% ... Success rate: 98.05% ... Last error: 31 Dec 2012"
  end

  get '/stats.txt' do
    "Requests: 404:30 200:520 301:5 500:0 ... App stats: DB calls: 49 App mem: 1GB, DB size: 5GB"
  end

  get '/repos.txt' do
    Ocular::Config.repositories.collect { |repo| repo.split("/").last }.join(" ... ")
  end
end
