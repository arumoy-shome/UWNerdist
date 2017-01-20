class QueriesController < ApplicationController
  require 'httparty'

  BASE_URL = 'https://api.uwaterloo.ca/v2/'
  KEY = '.json?key=8ad66046399b0b52f5140393c5a488aa'

  def new
    @terms ||= to_json(get("terms/list"))
  end

  def create
    response = to_json(get("terms/#{params[:query][:term]}/courses"))

    if params[:query][:subject]
      subjects = sanitize(params[:query][:subject].split(','))

      @courses = response[:data].select do |course|
        subjects.include?(course[:subject])
      end
    else
        @courses = response
    end

    render :results unless @courses.empty?
  end

  private

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
