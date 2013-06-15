require 'json'
require 'sinatra'
require 'sinatra/base'

class OcularApi < Sinatra::Base

  get '/deploys' do
    "Deploy information will live here eventually"
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
      "#{commit[:author]}: #{commit[:message]} at #{commit[:date]}"
    end.join ' ... '
  end

  get '/errors' do
    "Errors information will live here eventually"
  end
end
