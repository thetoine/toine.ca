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

		# prepare array for project
		projects = []		
		
		# create a Project instance for each project
    JSON.parse(data).each do |project|			
		 	projects << Project.new(project)
		end
		
		# resort by name		
		return projects.sort_by { |project| [project.date, project.name] }.reverse
  end

	class Project

		def initialize(data)
			@data = data
		end

		def name
			@data[1]['name']
		end
		
		def client
			@data[1]['client']
		end
		
		def date
			@data[1]['date']						
		end
		
		def platform
			@data[1]['platform']						
		end
		
		def url
			@data[1]['url']
		end

	end
  
end

