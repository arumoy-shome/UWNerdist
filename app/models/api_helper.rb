require "httparty"
require "json"

module ApiHelper
  BASE_URL = 'https://api.uwaterloo.ca/v2/'
  KEY = ".json?key=#{ENV['KEY']}"

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def self.get(thread)
    parse(HTTParty.get("#{BASE_URL}#{thread}#{KEY}", format: :plain))
  end

  def self.term_name(id)
    term_name = "#{Time.current.year}"

    if /9$/.match?(id)
      term_name.prepend('Fall ')
    elsif /5$/.match?(id)
      term_name.prepend('Spring ')
    else
      term_name.prepend('Winter ')
    end

    term_name
  end
end
