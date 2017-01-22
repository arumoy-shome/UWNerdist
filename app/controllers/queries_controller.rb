class QueriesController < ApplicationController
  require 'httparty'

  BASE_URL = 'https://api.uwaterloo.ca/v2/'
  KEY = '.json?key=8ad66046399b0b52f5140393c5a488aa'
  DAYS = { 1 => "M", 2 => "T", 3 => "W", 4 => "Th", 5 => "F" }

  def new
    @terms ||= to_json(get("terms/list"))
  end

  def result
    response = to_json(get("terms/#{params[:query][:term]}/courses"))

    @courses = filtered_by_subject(response)
  end

  private

  def is_today?(raw)
    raw.scan(/[A-Z][^A-Z]*/).include?(DAYS(Time.now.wday))
  end

  def filtered_by_subject(response)
    return response unless params[:query][:subject]

    subjects = sanitize(params[:query][:subject].split(','))

    response[:data].select{ |course| subjects.include?(course[:subject]) }
  end

  def sanitize(dirty_list)
    clean_list = []

    dirty_list.each { |item| clean_list << item.strip.upcase }

    clean_list
  end

  def get(thread)
    HTTParty.get("#{BASE_URL}#{thread}#{KEY}", format: :plain)
  end

  def to_json(response)
    JSON.parse(response, symbolize_names: true)
  end
end
