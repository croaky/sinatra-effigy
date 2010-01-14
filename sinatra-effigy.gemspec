# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sinatra-effigy}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Croak"]
  s.date = %q{2010-01-14}
  s.description = %q{Ruby in .rb files. HTML in .html files.}
  s.email = %q{dcroak@thoughtbot.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "lib/sinatra/effigy.rb",
     "sinatra-effigy.gemspec"
  ]
  s.homepage = %q{http://github.com/dancroak/sinatra-effigy}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{An Effigy extension for Sinatra.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0"])
      s.add_runtime_dependency(%q<effigy>, [">= 0"])
    else
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<effigy>, [">= 0"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<effigy>, [">= 0"])
  end
end

