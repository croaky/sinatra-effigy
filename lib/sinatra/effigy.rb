require 'sinatra/base'
require 'effigy'

module Sinatra
  module EffigyHelper
    module Helpers
      def effigy(name)
        template   = File.read(File.join(options.root, "templates", "#{name}.html"))
        camel_name = "#{name}_view".gsub(' ', '_').gsub(/(?:^|_)(.)/) { $1.upcase }
        view       = Object.const_get(camel_name).new
        view.render(template)
      end
    end
  end

  helpers EffigyHelper
end
