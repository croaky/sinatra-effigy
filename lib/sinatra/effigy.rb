require 'sinatra/base'
require 'effigy'

module Sinatra
  module EffigyHelper
    Dir['views/*'].each {|view| require view }

    def effigy(name, *locals)
      camel_name = "#{name}_view".
                      gsub(' ', '_').
                      gsub(/\/(.)/)  { "::#{$1.upcase}" }.
                      gsub(/(?:^|_)(.)/) { $1.upcase }
      view     = Object.const_get(camel_name).new(*locals)
      template = File.read("templates/#{name}.html")
      view.render(template)
    end
  end

  helpers EffigyHelper
end
