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

    get '/jobs/:id' do |id|
      effigy :job, Job.find(id)
    end

Create your template (fresh from a designer?) at /templates/job.html:

    <!DOCTYPE html>
    <html>
    <head>
      <title>Web Designer at thoughtbot</title>
    </head>
    <body>
      <h1>Web Designer</h1>
      <h2><a href="http://example.com">thoughtbot</a></h2>
      <h3>Boston or New York</h3>

      <div id="description">
        <p>Graphic design, typography, CSS, HTML.</p>
      </div>

      <h3>Apply</h3>
      <p>Please contact <span id="apply-at">jobs@example.com</span>.</p>
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
        f('h2 a').attr(:href => job.company_url).
                  text(job.company)
        f('#description').html(job.description)
        f('#apply-at').text(job.apply_at)
      end
    end

Conventions
-----------

Assumes matching Ruby files at views/ and HTML files at templates/.

Use a string if you need directories:

    get '/jobs/edit/:id' do |id|
      effigy 'jobs/edit', Job.find(id)
    end

Resources
---------

* [Effigy](http://github.com/jferris/effigy)
* [Sinatra](http://sinatrarb.com)
