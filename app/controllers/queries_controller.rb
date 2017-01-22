class QueriesController < ApplicationController
  require 'request'

  DAYS = { 1 => "M", 2 => "T", 3 => "W", 4 => "Th", 5 => "F" }

  def new
    @terms ||= to_json(Request.new("terms/list").get)
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

  def to_json(response)
    JSON.parse(response, symbolize_names: true)
  end
end
