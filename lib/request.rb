class Request
  require 'httparty'

  attr_reader :thread

  BASE_URL = 'https://api.uwaterloo.ca/v2/'
  KEY = '.json?key=8ad66046399b0b52f5140393c5a488aa'

  def initialize(thread)
    @thread = thread
  end

  def get
    HTTParty.get("#{BASE_URL}#{thread}#{KEY}", format: :plain)
  end
end
