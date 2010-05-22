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

helpers do
            
  def get_projects
    data = File.open(PROJECTS_FILE).read    	

		# prepare array for project
		projects = []		
		
		# create a Project class instance for each item
    JSON.parse(data).each do |p|			
		 	projects << Project.new(p)
		end
		
		# resort by date		
		return projects.sort_by { |project| [project.date] }.reverse
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

