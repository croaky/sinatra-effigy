Sinatra Effigy
==============

An Effigy extension for Sinatra. HTML in .html files. Ruby in .rb files.

Usage
-----

Install the gem:

    sudo gem install sinatra-effigy

Create your Sinatra app:

    require 'rubygems'
    require 'sinatra'
    require 'sinatra/effigy'

    get '/jobs/:id' do |id|
      job = mongo['jobs'].find('id' => id)
      effigy :job, job
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

      <p>Graphic design, typography, CSS, HTML.</p>

      <h3>Apply</h3>
      <p>Please contact jobs@example.com</p>
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

Assumes matching files at views/*.rb and templates/*.html.

Use a string if you need directories:

    get '/jobs/edit/:id' do |id|
      job = mongo['jobs'].find('id' => id)
      effigy 'jobs/edit', job
    end

Resources
---------

* [Effigy](http://github.com/jferris/effigy)
* [Sinatra](http://sinatrarb.com)
