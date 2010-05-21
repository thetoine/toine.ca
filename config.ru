# This file goes in domain.com/config.ru
require 'rubygems'
require 'sinatra'
 
Sinatra::Application.default_options.merge!(
  :run => false,
  :env => ENV['RACK_ENV']
)

require 'portfolio'

run Sinatra.application