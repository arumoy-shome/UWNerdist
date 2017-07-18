require "httparty"
require "json"

class Request

  attr_reader :thread, :term, :subjects

  DAYS = { 1 => "M", 2 => "T", 3 => "W", 4 => "Th", 5 => "F" }
  BASE_URL = 'https://api.uwaterloo.ca/v2/'
  KEY = ".json?key=#{ENV['KEY']}"

  def initialize(thread = nil, **args)
    @thread = thread
    @term = args[:term]
    @subjects = args[:subjects]
  end

  def get_schedules
    sane_subjects = sanitize(subjects.split(','))
    courses = []
    sane_subjects.each do |subject|
      courses_for_subject = to_json(HTTParty.get("#{BASE_URL}terms/#{term}/#{subject}/schedule#{KEY}",
                                                 format: :plain))[:data]

      courses << todays_courses(courses_for_subject)
    end
    courses.flatten
  end

  def get
    to_json(HTTParty.get("#{BASE_URL}#{thread}#{KEY}", format: :plain))
  end

  private

  def todays_courses(courses)
    courses.select{ |course| is_today?(course[:classes][0][:date][:weekdays]) }
  end

  def is_today?(raw)
    return false unless raw

    raw.scan(/[A-Z][^A-Z]*/).include?(DAYS[Time.now.wday])
  end

  def to_json(response)
    JSON.parse(response, symbolize_names: true)
  end

  def sanitize(dirty_list)
    clean_list = []

    dirty_list.each { |item| clean_list << item.strip.upcase }

    clean_list
  end
end
