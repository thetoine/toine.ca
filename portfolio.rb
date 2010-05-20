require 'rubygems'
require 'sinatra'
require 'json'

PROJECTS_FILE = "#{File.dirname(__FILE__)}/projects.json"

get '/' do
  @title = "toine.ca | Antoine Girard"  
  @projects = get_projects    
  erb :index
end
                                  
get '/projects/:slug' do
  @title = "#{params[:slug]}"
  @html = "Your project, sir!"
  puts '1'
  erb :project  
end

helpers do
            
  def get_projects
    data = File.open(PROJECTS_FILE).read    
    return JSON.parse(data)
  end
  
end