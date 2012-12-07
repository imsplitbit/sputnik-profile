module Sputnik
  class CLI
    class Console
      def error(e)
        $stderr.puts e.message
      end
    end
  end
end