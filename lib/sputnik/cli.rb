require 'sputnik'
require 'sputnik/cli/namespace_command_loader'
require 'sputnik/cli/console'

module Sputnik
  class CLI
    def initialize(loader = NamespaceCommandLoader.new, console = Console.new)
      @loader = loader
      @console = console
    end

    def start(*args)
      if cmd = @loader[args.first]
        cmd.call *args.slice(1..-1)
        return 0
      end
      fail UnknownCommandError, args.first
    rescue Exception => e
      @console.error(e)
      e.respond_to?(:to_exit_status) ? e.to_exit_status : 1
    end

    def self.start(*args)
      new.start *args
    end
  end

  class UnknownCommandError < StandardError
    def initialize(command)
      super "unkown command #{command}"
    end
  end
end