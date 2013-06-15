module Ocular
  module Config
    class << self
      attr_accessor :login, :password, :repository

      def configure
        yield self
        true
      end
      alias :config :configure
    end
  end
end
