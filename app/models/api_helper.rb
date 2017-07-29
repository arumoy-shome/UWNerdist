require "httparty"
require "json"

module ApiHelper
  BASE_URL = 'https://api.uwaterloo.ca/v2/'
  KEY = ".json?key=#{ENV['KEY']}"

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def get(thread)
    parse(HTTParty.get("#{BASE_URL}#{thread}#{KEY}", format: :plain))
  end
end
