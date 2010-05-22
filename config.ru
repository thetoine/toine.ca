# This file goes in domain.com/config.ru
require 'rubygems'
require 'sinatra'
 
set :env,  :production
disable :run

require 'portfolio'

run Sinatra::Application