require 'json'
require 'sinatra'
require 'sinatra/base'

class OcularApi < Sinatra::Base

  get '/deploys' do
    "Deploy information will live here eventually"
  end

  get '/commits.json' do
    response = {
      commit: [
        {
          user: 'baphled',
          message: 'A cool new change',
          date: '2013-1-16'
        }
      ]
    }
    JSON.generate response
  end

  get '/errors' do
    "Errors information will live here eventually"
  end
end
