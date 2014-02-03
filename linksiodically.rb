require 'sinatra'
require 'pry'
# require 'redis'
require './config'
require 'faker', '1.1.2'
require 'sqlite3'


get '/' do
	erb :index
end