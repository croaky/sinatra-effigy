require 'spec_helper'

shared_examples_for 'effigy-enabled sinatra app' do
  it 'returns pure HTML template when no Ruby view exists' do
    get '/'

    last_response.should be_ok
    last_response.body.should include("<html>pure</html>")
  end

  it 'returns HTML that has been set by a Ruby view' do
    get '/job'

    last_response.should be_ok
    last_response.body.should include("<title>President at USA</title>")
  end
end

shared_examples_for 'default install' do
  it 'knows where the template and view directories are' do
    app.views.should == 'views'
    app.templates.should == 'templates'
  end
end

shared_examples_for 'custom install' do
  it 'knows where the template and view directories are' do
    app.views.should == 'custom_views'
    app.templates.should == 'custom_templates'
  end
end

Job = Struct.new(:position, :company)

describe 'classic app with default Sinatra::Effigy install' do
  def app
    Sinatra::Application
  end

  before do
    Sinatra::Application.instance_eval do
      get '/' do
        effigy :index
      end

      get '/job' do
        effigy :job, Job.new("President", "USA")
      end
    end

    @app = Sinatra::Application
  end

  it_should_behave_like 'effigy-enabled sinatra app'
  it_should_behave_like 'default install'
end

describe 'classic app with custom Sinatra::Effigy install' do
  def app
    Sinatra::Application
  end

  before do
    Sinatra::Application.instance_eval do
      set :views,     Proc.new { 'custom_views' }
      set :templates, Proc.new { 'custom_templates' }

      get '/' do
        effigy :index
      end

      get '/job' do
        effigy :job, Job.new("President", "USA")
      end
    end

    @app = Sinatra::Application
  end

  it_should_behave_like 'effigy-enabled sinatra app'
  it_should_behave_like 'custom install'
end

class DefaultApp < Sinatra::Base
  register Sinatra::Effigy

  set :environment, :test

  get '/' do
    effigy :index
  end

  get '/job' do
    Job = Struct.new(:position, :company)
    effigy :job, Job.new("President", "USA")
  end
end

describe 'modular app with default Sinatra::Effigy install' do
  def app
    DefaultApp
  end

  it_should_behave_like 'effigy-enabled sinatra app'
  it_should_behave_like 'default install'
end

class CustomApp < Sinatra::Base
  register Sinatra::Effigy

  set :environment, :test
  set :views,     Proc.new { 'custom_views' }
  set :templates, Proc.new { 'custom_templates' }

  get '/' do
    effigy :index
  end

  get '/job' do
    Job = Struct.new(:position, :company)
    effigy :job, Job.new("President", "USA")
  end
end

describe 'modular app with custom Sinatra::Effigy install' do
  def app
    CustomApp
  end

  it_should_behave_like 'effigy-enabled sinatra app'
  it_should_behave_like 'custom install'
end
