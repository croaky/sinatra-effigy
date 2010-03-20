require 'sinatra/base'
require 'effigy'

module Sinatra
  module Effigy
    module Helpers
      def effigy(name, *locals)
        view_file     = "#{options.views}/#{name}.rb"
        template_file = "#{options.templates}/#{name}.html"

        if File.exists?(view_file)
          camel_name = "#{name}_view".
                          gsub(' ', '_').
                          gsub(/\/(.)/)  { "::#{$1.upcase}" }.
                          gsub(/(?:^|_)(.)/) { $1.upcase }
          view      = Object.const_get(camel_name).new(*locals)
          template  = File.read(template_file)
          view.render(template)
        else
          File.read(template_file)
        end
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
