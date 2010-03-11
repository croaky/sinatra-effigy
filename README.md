Sinatra Effigy
==============

An Effigy extension for Sinatra.

Why?
----

* HTML should be in .html files. Ruby should be in .rb files.
* Effigy follows the jQuery API - just replace $() with f().
* Effigy has 100% test coverage and 0 Reek smells.

Usage
-----

Install the gem:

    sudo gem install sinatra-effigy

Create your Sinatra app:

    require 'rubygems'
    require 'sinatra'
    require 'sinatra/effigy'

    set :app_file, __FILE__

    get '/jobs/:id' do |id|
      effigy :job, Job.find(id)
    end

Create your template (fresh from a designer?) at /templates/job.html:

    <!DOCTYPE html>
    <html>
    <head lang="en">
      <meta charset="utf-8">
      <title>Web Designer at thoughtbot</title>
    </head>
    <body>
      <header>
        <hgroup>
          <h1>Web Designer</h1>
          <h2><a href="http://example.com">thoughtbot</a></h2>
          <h3>Boston or New York</h3>
        </hgroup>
      </header>

      <div id="description">
        <p>Graphic design, typography, CSS, HTML.</p>
      </div>
    </body>
    </html>

Create a view at /views/job.rb that responds to #transform:

    class JobView < Effigy::View
      attr_reader :job

      def initialize(job)
        @job = job
      end

      def transform
        f('title').text("#{job.position} at #{job.company}")
        f('h1').text(job.position)
        f('h2 a').attr(:href => job.company_url).text(job.company)
        f('#description').html(job.description)
      end
    end

Conventions
-----------

Assumes matching Ruby files at views/ and HTML files at templates/.

Use a string if you need directories:

    get '/jobs/edit/:id' do |id|
      effigy 'jobs/edit', Job.find(id)
    end

Override
--------

Want to put your Ruby or HTML files elsewhere?

    set :templates, 'somewhere/else'
    set :views,     'not/views'

Gotchas
-------

If you use Gem Bundler, set the app_file option in your Sinatra app:

    set :app_file, __FILE__

Resources
---------

* [Effigy](http://github.com/jferris/effigy)
* [Sinatra](http://sinatrarb.com)

Authors
-------

Dan Croak, Danny Tatom
