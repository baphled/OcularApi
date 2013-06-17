module Ocular
  module Config
    class << self
      attr_accessor :login, :password, :repository

      attr_accessor :webistrano_url, :deploy_project, :deploy_stage

      def configure
        yield self
        true
      end
      alias :config :configure
    end
  end
end
