require 'sinatra/base'
require 'effigy'

module Sinatra
  module EffigyHelper
    if File.directory?('views')
      Dir['views/*'].each {|view| require view }
    end

    def effigy(name)
      template   = File.read(File.join(options.root, "templates", "#{name}.html"))
      camel_name = "#{name}_view".gsub(' ', '_').gsub(/(?:^|_)(.)/) { $1.upcase }
      view       = Object.const_get(camel_name).new
      view.render(template)
    end
  end

  helpers EffigyHelper
end
