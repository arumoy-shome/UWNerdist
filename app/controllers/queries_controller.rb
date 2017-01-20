class QueriesController < ApplicationController
  require 'httparty'

  BASE_URL = 'https://api.uwaterloo.ca/v2/'
  KEY = '.json?key=8ad66046399b0b52f5140393c5a488aa'

  def new
    @terms ||= to_json(get("terms/list"))
  end

  def create
    @courses = to_json(get("terms/#{params[:query][:term]}/courses"))

    render :results unless @courses[:data].empty?
  end

  private

  def get(thread)
    HTTParty.get("#{BASE_URL}#{thread}#{KEY}", format: :plain)
  end

  def to_json(response)
    JSON.parse(response, symbolize_names: true)
  end
end
