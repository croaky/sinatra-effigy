require 'sinatra/base'
require 'effigy'

module Sinatra
  module Effigy
    module Helpers
      def effigy(name, *locals)
        camel_name = "#{name}_view".
                        gsub(' ', '_').
                        gsub(/\/(.)/)  { "::#{$1.upcase}" }.
                        gsub(/(?:^|_)(.)/) { $1.upcase }
        view      = Object.const_get(camel_name).new(*locals)
        template  = File.read("#{options.templates}/#{name}.html")
        view.render(template)
      end
    end

    def self.registered(app)
      app.helpers Effigy::Helpers

      app.set :templates, 'templates'
      app.set :views,     'views'

      Dir["#{app.views}/*"].each { |view| require view }
    end
  end

  register Effigy
end
