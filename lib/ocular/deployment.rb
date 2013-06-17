module Ocular
  class Deployment
    def initialize(opts = {})
      @opts = opts
    end

    def date
      @opts[:timestamp]
    end

    def status
      @opts[:status]
    end

    def finished_at
      @opts[:finished_at]
    end

    def user
      @opts[:user]
    end

    def revision
      @opts[:revision]
    end

    def short_revision
      revision[0 .. 8]
    end

    def description
      @opts[:description]
    end
  end
end
