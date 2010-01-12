require 'sinatra/base'
require 'effigy'

module Sinatra
  module EffigyHelper
    if File.directory?('views')
      Dir['views/*'].each {|view| require view }
    end

    def effigy(name, *locals)
      camel_name = "#{name}_view".
                      gsub(' ', '_').
                      gsub(/\/(.)/)  { "::#{$1.upcase}" }.
                      gsub(/(?:^|_)(.)/) { $1.upcase }
      if locals.any?
        view = Object.const_get(camel_name).new(locals)
      else
        view = Object.const_get(camel_name).new
      end
      template = File.read(File.join(options.root, "templates", "#{name}.html"))
      view.render(template)
    end
  end

  helpers EffigyHelper
end
