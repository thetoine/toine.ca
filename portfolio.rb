require 'rubygems'
require 'sinatra'
require 'json'

# constants
PROJECTS_FILE = "#{File.dirname(__FILE__)}/projects.json"

# root
get '/' do
  @title = "toine.ca | Antoine Girard"  
  @projects = get_projects    
  erb :index
end

# project page                                  
get '/projects/:slug' do
  @title = "#{params[:slug]}"
  erb :project
end

helpers do
            
  def get_projects
    data = File.open(PROJECTS_FILE).read    
    return JSON.parse(data)
  end
  
end