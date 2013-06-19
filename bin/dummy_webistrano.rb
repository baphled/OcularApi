#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/base'

  get '/projects/some-project/stages/staging/deployments/latest.xml' do
    file = File.read('./spec/fixtures/latest.xml')
    file
  end

  get '/users/15.xml' do
    file = File.read('./spec/fixtures/user.xml')
    file
  end
